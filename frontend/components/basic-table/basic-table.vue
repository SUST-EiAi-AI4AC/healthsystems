<template>
	<view class="base-table" :style="[getTableStyle]" :class="{ 'is-border': border, 'no-data': data.length === 0 }">
		<view class="base-table-inner">
			<view class="base-table-header" v-if="showHeader">
				<view class="b-table" :style="[tableBodyStyle]">
					<view class="b-thead">
						<view class="b-tr" :class="getHeaderClass" :style="getHeaderStyle" @click="handleHeaderClick">
							<view class="b-th" v-if="indexShow" :style="[getIndexColStyle]">
								<view class="b-cell">序号</view>
							</view>
							<view class="b-th" v-for="item in columns" :key="item.fieldName"
								:class="[getCellProps(item).class]" :style="[getCellProps(item).style]">
								<view class="b-cell">{{ item.fieldDesc }}</view>
							</view>
						</view>
					</view>
				</view>
			</view>
			<view class="base-table-body">
				<view class="b-table" :style="[tableBodyStyle]">
					<view class="b-tbody" v-if="data.length > 0">
						<view class="b-tr" v-for="(scope, index) in data" :key="index"
							:class="[...getBodyClass(scope, index)]" :style="[...getBodyStyle(scope, index)]"
							@click="handleRowClick(scope, index)">
							<view class="b-td" v-if="indexShow" :style="[getIndexColStyle]">
								<view class="b-cell">{{ getIndexMethod(index) }}</view>
							</view>
							<view class="b-td" v-for="column in columns" :key="column.fieldName"
								:class="[getCellProps(column).class]" :style="[getCellProps(column).style]">
								<view class="b-cell" @click.stop="handleCellClick(scope, column, index)">
									<slot name="item" :scope="scope" :column="column"
										v-if="column.fieldType === 'slot'"></slot>
									<view v-else>{{ scope[column.fieldName] }}</view>
								</view>
							</view>
						</view>
					</view>
					<view class="base-table-empty" v-else>
						<view class="mt20" v-if="!$slots.empty">{{ emptyText }}</view>
						<slot name="empty"></slot>
					</view>
				</view>
			</view>
			<view class="base-table-footer" v-if="showFooter">
				<view class="b-table" :style="[tableBodyStyle]">
					<view class="b-tbody">
						<view class="b-tr">
							<view class="b-td" v-if="indexShow" :style="[getIndexColStyle]">
								<view class="b-cell">{{ footerText }}</view>
							</view>
							<view class="b-td" v-for="(item, index) in sumList" :key="index"
								:class="[getCellProps(columns[index]).class]"
								:style="[getCellProps(columns[index]).style]">
								<view class="b-cell">{{ item }}</view>
							</view>
						</view>
					</view>
				</view>
			</view>
		</view>
	</view>
</template>

<script>
	export default {
		props: {
			columns: {
				type: Array,
				default: () => []
			},
			data: {
				type: Array,
				default: () => []
			},
			align: {
				type: String,
				default: 'left'
			},
			height: {
				type: String
			},
			maxHeight: {
				type: String
			},
			width: {
				type: String,
				default: '100%'
			},
			emptyText: {
				type: String,
				default: '暂无数据'
			},
			border: {
				type: Boolean,
				default: false
			},
			stripe: {
				type: Boolean,
				default: false
			},
			showHeader: {
				type: Boolean,
				default: true
			},
			showFooter: {
				type: Boolean,
				default: false
			},
			footerMethod: {
				type: Function
			},
			footerText: {
				type: String,
				default: '合计'
			},
			indexShow: {
				type: Boolean,
				default: false
			},
			minItemWidth: {
				type: Number,
				default: 80
			},
			rowClassName: {
				type: [Function, String]
			},
			rowStyle: {
				type: [Function, Object]
			},
			indexMethod: {
				type: Function
			},
			headerRowClassName: {
				type: String
			},
			headerRowStyle: {
				type: Object
			},
			indexWidth: {
				type: String,
				default: '60px'
			}
		},
		data() {
			return {
				sumList: [],
				tableWidth: 0
			};
		},
		mounted() {
			const query = uni.createSelectorQuery().in(this).select('.base-table');
			query.boundingClientRect(data => {
				this.tableWidth = data.width;
			}).exec();
		},
		computed: {
			getTableStyle() {
				const {
					width,
					height,
					maxHeight
				} = this;
				const styleObj = {};
				if (width) {
					styleObj.width = width;
				}
				if (height) {
					styleObj.height = height;
				}
				if (maxHeight) {
					styleObj.maxHeight = maxHeight;
				}
				return styleObj;
			},
			tableBodyStyle() {
				if (!this.tableWidth) return {};
				const clienWidth = this.tableWidth;
				const flexColumn = this.columns.filter(item => !item.width);
				//set min width
				const minWidth = this.minItemWidth;

				let bodyMinWidth = this.columns.reduce((t, c) => {
					c.width = c.width || minWidth;
					return t + parseFloat(c.width);
				}, 0);
				if (this.indexShow) {
					bodyMinWidth += parseFloat(this.indexWidth)
				}
				if (flexColumn.length > 0 && bodyMinWidth < clienWidth) {
					const flexWidth = clienWidth - bodyMinWidth;
					if (flexColumn.length === 1) {
						flexColumn[0].width = minWidth + flexWidth;
					} else {
						const scaleWidth = flexWidth / flexColumn.length;
						flexColumn.forEach(item => {
							item.width = minWidth + Math.floor(scaleWidth);
						});
					}
				}
				bodyMinWidth = Math.max(bodyMinWidth, clienWidth);
				return {
					width: `${bodyMinWidth}px`
				};
			},
			showXScroll() {
				const clienWidth = this.tableWidth;
				return clienWidth < parseFloat(this.tableBodyStyle?.width || 0);
			},
			isEmpty() {
				return this.data.length === 0;
			},
			getHeaderClass() {
				const headerClass = [];
				if (this.headerRowClassName) {
					headerClass.push(this.headerRowClassName);
				}
				return headerClass;
			},
			getHeaderStyle() {
				const headerStyle = [];
				if (typeof this.headerRowStyle === 'object') {
					if (this.headerRowStyle) {
						headerStyle.push(this.headerRowStyle);
					}
				}
				return headerStyle;
			},
			getIndexColStyle() {
				return {
					textAlign: this.align,
					width: this.indexWidth
				};
			}
		},
		methods: {
			init() {
				this.sumList = [];
				if (this.showFooter && this.data.length > 0) {
					const {
						columns,
						data,
						footerText
					} = this;
					if (typeof this.footerMethod === 'function') {
						this.sumList = this.footerMethod({
							columns,
							data
						});
					} else {
						columns.forEach((column, index) => {
							if (!this.indexShow && index === 0) {
								this.sumList[index] = footerText;
								return;
							}
							const values = data.map(item => Number(item[column.fieldName]));
							const precisions = [];
							let notNumber = true;
							values.forEach(value => {
								if (!Number.isNaN(+value)) {
									notNumber = false;
									const decimal = `${value}`.split('.')[1];
									precisions.push(decimal ? decimal.length : 0);
								}
							});
							const precision = Math.max.apply(null, precisions);
							if (!notNumber) {
								this.sumList[index] = values.reduce((prev, curr) => {
									const value = Number(curr);
									if (!Number.isNaN(+value)) {
										return Number.parseFloat((prev + curr).toFixed(Math.min(precision,
											20)));
									} else {
										return prev;
									}
								}, 0);
							} else {
								this.sumList[index] = '';
							}
						});
					}
				}
			},

			getBodyClass(scope, index) {
				const bodyClass = [];
				if (this.stripe) {
					bodyClass.push({
						'is-stripe': index % 2 === 1
					});
				}
				if (typeof this.rowClassName === 'function') {
					const rowClass = this.rowClassName?.(scope, index);
					if (rowClass) {
						bodyClass.push(rowClass);
					}
				} else if (typeof this.rowClassName === 'string') {
					if (this.rowClassName) {
						bodyClass.push(this.rowClassName);
					}
				}
				return bodyClass;
			},

			getBodyStyle(scope, index) {
				const bodyStyle = [];
				if (typeof this.rowStyle === 'function') {
					const rowStyle = this.rowStyle?.(scope, index);
					if (rowStyle) {
						bodyStyle.push(rowStyle);
					}
				} else if (typeof this.rowStyle === 'object') {
					if (this.rowStyle) {
						bodyStyle.push(this.rowStyle);
					}
				}
				return bodyStyle;
			},

			getIndexMethod(index) {
				let curIndex = index + 1;
				if (typeof this.indexMethod === 'function') {
					curIndex = this.indexMethod?.(index);
				}
				return curIndex;
			},

			getCellProps(row) {
				const classList = [];
				if (this.showXScroll && row.fixed) {
					classList.push('fixed');
					if (row.fixed === 'left') {
						classList.push('fixed-left');
					} else {
						classList.push('fixed-right');
					}
				}
				return {
					class: classList,
					style: {
						width: `${row.width}px`,
						textAlign: this.align,
						minWidth: `${this.minItemWidth}px`
					}
				};
			},

			handleHeaderClick() {
				this.$emit('header-click');
			},

			handleRowClick(scope, index) {
				this.$emit('row-click', scope, index);
			},

			handleCellClick(scope, column, index) {
				this.$emit('cell-click', {
					scope,
					column,
					index
				});
			},
		},
		watch: {
			data: {
				handler() {
					this.init();
				},
				immediate: true,
				deep: true
			}
		}
	};
</script>

<style lang="scss" scoped>
	@import './basic-table.scss';
</style>