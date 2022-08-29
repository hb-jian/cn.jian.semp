<template>
  <div class="statistics-box">
    <div class="el-row" style="margin-right: -5px">
      <div class="el-col el-col-24 el-col-xs-24 item-box">
        <div class="el-card box-card is-always-shadow">
          <div class="user-avator">
            <div class="header-item">
              <div class="header-item-img-box">
                <img src="@/assets/images/dbzb_icon.png"/>
              </div>
              <el-divider direction="vertical" style="height: 100%"></el-divider>
              <div class="header-item-right">
                <div class="header-item-right-upper">
                  制冷
                </div>
                <div class="header-item-right-lower">
                  399kw
                </div>
              </div>
            </div>
            <div class="header-item">
              <div class="header-item-img-box">
                <img src="@/assets/images/dbzb_icon.png"/>
              </div>
              <el-divider direction="vertical" style="height: 100%"></el-divider>
              <div class="header-item-right">
                <div class="header-item-right-upper">
                  制热
                </div>
                <div class="header-item-right-lower">
                  2000kw
                </div>
              </div>
            </div>
            <div class="header-item">
              <div class="header-item-img-box">
                <img src="@/assets/images/dbzb_icon.png"/>
              </div>
              <el-divider direction="vertical" style="height: 100%"></el-divider>
              <div class="header-item-right">
                <div class="header-item-right-upper">
                  覆盖面积
                </div>
                <div class="header-item-right-lower">
                  10000平方
                </div>
              </div>
            </div>
            <div class="header-item">
              <div class="header-item-img-box">
                <img src="@/assets/images/cunchu_icon.png"/>
              </div>
              <el-divider direction="vertical" style="height: 100%"></el-divider>
              <div class="header-item-right">
                <div class="header-item-right-upper">
                  耗电量
                </div>
                <div class="header-item-right-lower">
                  3000
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="el-col el-col-24 el-col-xs-24 item-box">
        <div class="el-card box-card is-always-shadow echarts-box">
          <div class="el-card__header hrader-text">
            <div class="clearfix">
              <span>C.O.P 统计</span>
            </div>
            <div class="echarts-box-item">
              <div id="cop_statistics" style="width: 100%; height: 100%"></div>
            </div>
          </div>
        </div>
      </div>
      <div class="el-col el-col-24 el-col-xs-24 item-box">
        <div class="el-card box-card is-always-shadow echarts-box">
          <div class="el-card__header hrader-text">
            <div class="clearfix">
              <span>能耗统计</span>
            </div>
            <div class="echarts-box-item">
              <div id="ce_statistics" style="width: 100%; height: 100%"></div>
            </div>
          </div>
        </div>
      </div>
      <div class="el-col el-col-24 el-col-xs-24 item-box echarts-box">
        <div class="el-card box-card is-always-shadow" style="height: 400px; margin-bottom: 20px">
          <div class="el-card__header hrader-text">
            <div class="clearfix">
              <span>覆盖面统计</span>
            </div>
            <div class="echarts-box-item">
              <div id="coverage_area_statistics" style="width: 100%; height: 100%"></div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import echarts from "echarts";

  export default {
    name: "Performance",
    data() {
      return {
        copData: [
          ["Income", "Life Expectancy", "Population", "Country", "Year"],
          [815, 34.05, 351014, "cop", 2015],
          [1314, 39, 645526, "cop", 2016],
          [985, 32, 321675013, "cop", 2017],
          [864, 32.2, 345043, "cop", 2018],
          [1244, 36.5731262, 977662, "cop", 2019],
          [1803, 33.96717024, 29355111, "cop", 2020],
          [1639, 38.37, 22886919, "cop", 2021],
          [926, 42.84559912, 61428, "cop", 2022]
        ],
        builderJson: {
          all: 10887,
          charts: {
            2015: 3237,
            2016: 2164,
            2017: 7561,
            2018: 7778,
            2019: 7355,
            2020: 2405,
            2021: 1842,
            2022: 2090
          },
          ie: 9743
        },
        downloadJson: {
          '机组A': 35,
          '机组B': 20,
          '机组C': 15,
          '机组D': 30
        }
      }
    },
    created() {
    },
    mounted() {
      this.drawCopChart(this.copData)
      this.drawCeChart(this.downloadJson,this.builderJson)
      this.drawCoverageArea();
    },
    methods: {
      drawCopChart(data) {
        var copChart = echarts.init(document.getElementById('cop_statistics'))
        const countries = [
          'cop',
        ];
        const datasetWithFilters = [];
        const seriesList = [];
        seriesList.push({
          type: 'line',
          showSymbol: false,
          endLabel: {
            show: true,
            formatter: function (params) {
              return params.value[1] + ': ' + params.value[0];
            }
          },
          labelLayout: {
            moveOverlap: 'shiftY'
          },
          emphasis: {
            focus: 'series'
          },
          data:[[2015,380],[2016,321],[2017,564],[2018,559],[2019,763],[2020,815],[2021,900]]
        });
        seriesList.push({
          name: 'cop占比',
          type: 'pie',
          radius: '35%',
          center: ['80%', '50%'],
          data: [
            { value: 1048, name: '优秀' },
            { value: 600, name: '良好' },
            { value: 580, name: '中等' },
            { value: 50, name: '差' }
          ]
        });
        var option = {
          animationDuration: 1000,
          dataset: [
            {
              id: 'dataset_raw',
              source: data
            },
            ...datasetWithFilters
          ],
          title: [
            {
              text: 'C.O.P曲线',
              left: '28%',
              top: '5%',
              textAlign: 'center'
            },
            {
              text: 'COP占比',
              left: '80%',
              top: '5%',
              textAlign: 'center'
            }
          ],
          tooltip: {
            order: 'valueDesc',
            trigger: 'axis'
          },
          xAxis: [
            {
              type: 'category',
              nameLocation: 'middle'
            },{
              type: 'value',
              max: 100,
              gridIndex: 1,
              splitLine: {
                show: false
              }
            }
          ],
          yAxis: [{
            name: '数值'
          },{
            gridIndex: 1,
            type: 'category',
            axisLabel: {
              interval: 0,
              rotate: 30
            },
            splitLine: {
              show: false
            }
          }],
          grid: [
            {
              top: 100,
              width: '50%',
              left: 10,
              containLabel: true
            },
            {
              top: '50%',
              width: '50%',
              bottom: '50%',
              left: 0,
              containLabel: true
            }
          ],
          series: seriesList
        };
        copChart.setOption(option)
      },

      drawCeChart(downloadJson,builderJson) {
        var ceChart = echarts.init(document.getElementById('ce_statistics'))
        const canvas = document.createElement('canvas');
        const ctx = canvas.getContext('2d');
        canvas.width = canvas.height = 100;
        ctx.textAlign = 'center';
        ctx.textBaseline = 'middle';
        ctx.globalAlpha = 0.08;
        ctx.font = '20px Microsoft Yahei';
        ctx.translate(50, 50);
        var option = {
          backgroundColor: {
            type: 'pattern',
            image: canvas,
            repeat: 'repeat'
          },
          tooltip: {},
          title: [
            {
              text: '累计能耗',
              subtext: '总计 ' + builderJson.all+' kwh/平方米',
              left: '25%',
              textAlign: 'center'
            },
            {
              text: '设备能耗分布',
              subtext:
                '总计 ' +
                Object.keys(downloadJson).reduce(function (all, key) {
                  return all + downloadJson[key];
                }, 0),
              left: '75%',
              textAlign: 'center'
            }
          ],
          grid: [
            {
              top: 50,
              width: '50%',
              // bottom: '45%',
              left: 10,
              containLabel: true
            },
            {
              top: 50,
              width: '45%',
              bottom: 10,
              left: 10,
              containLabel: true
            }
          ],
          yAxis: [
            {
              type: 'value',
              max: builderJson.all,
              splitLine: {
                show: true
              }
            },
            {
              type: 'value',
              max: builderJson.all,
              // gridIndex: 1,
              splitLine: {
                show: false
              }
            }
          ],
          xAxis: [
            {
              type: 'category',
              data: Object.keys(builderJson.charts),
              axisLabel: {
                interval: 0,
                rotate: 30
              },
              splitLine: {
                show: false
              }
            }
          ],
          series: [
            {
              type: 'bar',
              stack: 'chart',
              label: {
                position: 'right',
                show: true
              },
              data: Object.keys(builderJson.charts).map(function (key) {
                return builderJson.charts[key];
              })
            },
            {
              type: 'pie',
              radius:'35%',
              center: ['80%', '50%'],
              data: Object.keys(downloadJson).map(function (key) {
                return {
                  name: key.replace('.js', ''),
                  value: downloadJson[key]
                };
              })
            }
          ]
        };
        ceChart.setOption(option)
      },

      drawCoverageArea() {
        var aoverageAreaChart = echarts.init(document.getElementById('coverage_area_statistics'))
        var option = {
          tooltip: {
            trigger: 'axis',
            axisPointer: {
              type: 'cross',
              crossStyle: {
                color: '#999'
              }
            }
          },
          toolbox: {
            feature: {
              dataView: { show: true, readOnly: false },
              magicType: { show: true, type: ['line', 'bar'] },
              restore: { show: true },
              saveAsImage: { show: true }
            }
          },
          legend: {
            data: ['制冷', '制热', '面积']
          },
          xAxis: [
            {
              type: 'category',
              data: ['1月', '2月', '3月', '4月', '5月', '6月', '7月'],
              axisPointer: {
                type: 'shadow'
              }
            }
          ],
          yAxis: [
            {
              type: 'value',
              name: 'kwh/平方米',
              min: 0,
              max: 250,
              interval: 50,
              axisLabel: {
                formatter: '{value}'
              }
            }
          ],
          series: [
            {
              name: '制冷',
              type: 'bar',
              tooltip: {
                valueFormatter: function (value) {
                  return value + ' kwh/平方米';
                }
              },
              data: [
                2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3
              ]
            },
            {
              name: '制热',
              type: 'bar',
              tooltip: {
                valueFormatter: function (value) {
                  return value + ' kwh/平方米';
                }
              },
              data: [
                2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3
              ]
            },
            {
              name: '面积',
              type: 'line',
              yAxisIndex: 0,
              tooltip: {
                valueFormatter: function (value) {
                  return value + ' kwh/平方米';
                }
              },
              data: [22.0, 22.2, 23.3, 34.5, 36.3, 90.2, 90.3, 93.4, 123.0, 116.5, 212.0, 246.2]
            }
          ]
        };
        aoverageAreaChart.setOption(option)
      }
    }
  }
</script>

<style scoped>
  .statistics-box {
    padding: 10px;
    height: calc(100% - 50px);
    min-height: calc(100vh - 150px);
  }

  .user-avator {
    display: flex;
    justify-content: start;
  }
  .user-avator img {
    padding: 18px 0 0 25px;
    border-radius: 10%;
  }
  body .el-divider--vertical {
    display: inline-block;
    width: 1px;
    height: 100%;
    margin: 0 8px;
    vertical-align: middle;
    position: relative;
  }
  .header-item {
    display: flex;
    margin-top: 10px;
    width: 25%;
  }
  .header-item-img-box {
    width: 20%;
  }
  .header-item-right {
    height: 80px;
    margin-left: 20px;
  }
  .header-item-right-upper {
    font-size: 14px;
    font-weight: bold;
    margin-top: 7px;
  }
  .header-item-right-lower {
    font-size: 14px;
    font-weight: bold;
    margin-top: 22px;
    color: deepskyblue;
  }
  .hrader-text {
    text-align: center;
    font-size: 16px;
    font-weight: bold;
  }
  .echarts-box {
    height: 450px;
    margin-top: 15px;
  }
  .echarts-box-item {
    width: 100%;
    height: 350px;
    padding-bottom: 20px;
    padding-left: 20px
  }
</style>
