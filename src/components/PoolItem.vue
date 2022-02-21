<template>
  <div class="stake-item" data-v-476d617e="" data-v-6bed01e2="">
    <div class="flex row1" data-v-476d617e="">
      <div class="left" data-v-476d617e="">
        <div class="top" data-v-476d617e="">Earn FF</div>
        <div data-v-476d617e="">Stake FF</div>
      </div>
      <div class="right flex" data-v-476d617e="">
        <div class="el-image token0" data-v-476d617e=""><img class="el-image__inner" src="/img/FF.c30613b1.jpg" /><!--v-if--></div>
        <div class="el-image token1" data-v-476d617e=""><img class="el-image__inner" src="/img/FF.c30613b1.jpg" /><!--v-if--></div>
      </div>
    </div>
    <div class="pool-wrapper" data-v-476d617e="">
      <div class="flex row2" data-v-476d617e="">
        <div class="left" data-v-476d617e="">APY</div>
        <div class="right" data-v-476d617e="">
          0 <span data-v-476d617e="">%</span>
          <div class="el-image calculator" data-v-476d617e="">
            <img
              class="el-image__inner"
              src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAYpJREFUWEftV7FSg0AQ3bUmGT/BsfGo/QHyAZYpDZTOWNjahZR2VlqaUGprL35F+A9o9TkHdwwhKLkTBpzxGmC42X28t2/3YBp48cD5aVwAhBN4RJ9ev6wcxUm2jnWOHQaEswiJedkrAGCVZFHYBqBE2DEYjw4FkKSbWZfJS3b/LAAx8UFEsS0zv2ZgEAC5LRnaFdKeZXHWmRAT/62xZsAraTsrBhSAxsBJutm1cCHR/gLPrAFUow0iwbgA5G2aqNpGTfqEVQ2YJGjb+w9AOIslMYdGs0AcByf0gadcezUbtN/3+oCqkSYplA3NAchgWjtmegHolIjOGXy9zdYPDS7ppw+4U/8RoKs8em2a6Yw50MZVHECsJNDxXCe4B+NGPjPhdptGd21VX39v7QJ3GlwCiJQE8yIwLpI0eu1dguoskL3/zAnmzHhWRVmfBW3DyK4ITan+br+1BB0CMGOAgHeD5HoUS1nkvZZH3xdXeeI+8ExokNtw688ABv4xMfyWTraP69+wk08yDPIFnS2lMLlDZJMAAAAASUVORK5CYII="
            /><!--v-if-->
          </div>
        </div>
      </div>
      <div class="flex row3" data-v-476d617e="">
        <div data-v-476d617e="">Recent profit:</div>
        <text class="vaultTip" tabindex="0" aria-describedby="el-popper-9297" data-v-476d617e="">0.1% unstaking fee if withdrawn within 72h</text>
      </div>
      <button class="el-button el-button--default enable-contract" type="button" data-v-476d617e=""><!--v-if--><!--v-if--><span>Enabale Contract</span></button>
      <div class="flex row2" data-v-476d617e="">
        <div class="left" data-v-476d617e="">
          <div class="sortIcon auto" data-v-476d617e=""><i class="el-icon-refresh" data-v-476d617e=""></i>Auto</div>
          <i class="el-icon-question" tabindex="0" aria-describedby="el-popper-41" data-v-476d617e=""></i>
        </div>
        <div class="right row5 cursor-pointer" data-v-476d617e=""><span data-v-476d617e="">Details</span><span class="iconfont icon-arrow-down" data-v-476d617e=""></span></div>
      </div>
      <!---->
    </div>
    <div class="el-overlay" style="z-index: 2012; display: none;">
      <div class="el-overlay-dialog">
        <div class="el-dialog fg-dialog" aria-modal="true" role="dialog" aria-label="dialog">
          <div class="el-dialog__header">
            <div class="fg-dialog-title" data-v-6fbeb6d9="">
              <div class="left" data-v-6fbeb6d9=""><span data-v-6fbeb6d9="">Stake FF</span></div>
              <div class="right" data-v-6fbeb6d9="">
                <img
                  class="close-img"
                  src="data:image/png;base64,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"
                  data-v-6fbeb6d9=""
                />
              </div>
            </div>
            <!--v-if-->
          </div>
          <!--v-if--><!--v-if-->
        </div>
      </div>
    </div>
    <div class="el-overlay" style="z-index: 2013; display: none;">
      <div class="el-overlay-dialog">
        <div class="el-dialog fg-dialog" aria-modal="true" role="dialog" aria-label="dialog">
          <div class="el-dialog__header">
            <div class="fg-dialog-title" data-v-1d1dd922="">
              <div class="left" data-v-1d1dd922=""><span data-v-1d1dd922="">Unstake FF</span></div>
              <div class="right" data-v-1d1dd922="">
                <img
                  class="close-img"
                  src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAFQAAABUCAYAAAAcaxDBAAANqElEQVR4Xu1deZAcVRn/fT2zkxVQIpA9+vVsWBLOyCGoFApyRLmRAOKBAaoUS1CuSFlQliLlPxpKCIeCVSIWp5BCQSvIIQTwohAVFFAxxiW7/XrX5TAogbA705/1W16HyWQ2O5uZ6ZnN7vdPKklPv9e//t77rt/7WtACMjg4uLOqvjeO4wWe5+2qqjsDmANgRwDvAPBOACMAXlPVtSLyPwCvisgLcRyv8jzvORF5qru7+4VmP440YwL9/f1+NptdqKqHAzgCwNw6zWMNgEdEZGWhUHi4p6cnqtN9q75NaoCuWbPm3dls9jMAPgXgIABeySxfBPBHAH8BsArAC57nRZ7nvSwi6zo6Ol5btWrVrPb29m1zudzs0dFRauxOItILYFcA+wA4wGl1clsF8DsAdxQKhdvmzp37n6pRqeHChgM6MDCwt+d5XwbwSbd8Od03ADyoqveLyCPGmOdreIYNP7XW7k6tF5GjARxZNt6dcRxfmc/nn6nHWOPdo2GARlF0gKpeBuA4ABwnBrBSRH6UzWZ/Tq1r5IMNDw9vNzo6egKAz7pthStCReQXAL7h+z5XRN2l7oBGUdSjqt92S5v3XwfgxjiOr8nn8/+s+xNUccP+/v55mUzmAgfutgSWW4GIXOL7fn8Vt6j6kroBqqpZa+0FIvJNANtwWYvI9Z7nLe3q6hquekYNvHBoaKgjjuOLVfUctx28rqqXGmOuFpFCPYauC6ADAwPzM5nMbar6ATepu0Vkie/7tLotJ24VXQXgJE5ORH5fLBYX5/N5GsSapGZAoyharKrXA9gOQMi3HwTBippmldKPwzA8nqsIQEAfV0TO8X3/1lqG32JAVTUTRdGVAM53E1heKBTOTss9qeWhS3/r3LnvA/iE+/drfd9fIiLFLRljiwDt6+trz+Vyt3PJiMioqi4xxnxvSybQKr+x1n5JRJapahuAu0dGRk7r7e1dP9n5TRrQvr6+2W1tbfeIyKEAXhGRRb7v/3qyA7fi9VEUHaKq9wDYQVUfGx0dXdTb27t2MnOdFKBueawEsB+ANap6ZBAE/5jMgK1+bRiGu4nIgy4cfrpQKBwxmW2sakBXr169fXt7+wMADhSR1XSW6+3DtQrY9AIYhKjqPABPrF+//qh58+a9Ws38qgLUGaCfAvgYLXkcx4c3y0mv5qHqcY21Ng/gNwAI7grf9xdVY6iqAtRaezWtuYi8WiwWD2l0PFwPQOpxD/rXnucxwcJU4jXGGEZbm5UJAY2i6HRVvZn5SFU9JggC7qHTRpyheghATlXPDIKAWIwrmwXUbdB/AsD499yp7hptqRZYa78IgG7hOlXdf3OGeFxAuW9aax8XkfcDWG6MYfpt2oq19g6mIFX1SWPMQePtp+MCSkcXwHdphAqFwj6TcR22RtSdy8gEOMPU84wxxGYTqQjo8PBw1+jo6N8AzFbVE6ZKbN7oFxmG4XEiwjzF2ra2tj07OjqGysesCGgYhreICJMePwmC4OONnuhUun8URctV9VRVvTUIgtMnBNRauz+APwB4M5PJ7NXV1dU3lR640XMdGhrqLRaLfwUwi/alPPO/iYZGUbRCVanay3zfZy1oRsoQsNZeDuArLKf4vs8SzwbZCNAwDPcTEbpJb2Qymd5WybS32hsdHBycE8cxV+42zo16OpnjRoBGUXSTqp4B4FpjTJLnbLXnaYn5WGuvobUXkZt93z9zE0CdW2C5N8RxvPvWHqvX+lZcWMry95uFQsEkbuUGDS3xOx8yxny01gGnw++ttb8E8JFSv7QUUGZWPgTgNGPMj6cDILU+o7X20wBYufitMeZg3m8M0IGBAeN53gCA9blcrnPOnDkkY83IBAg4MsW/WZIuFosBuVRjgFprzwLwAxG51/f942eQrB4Bay1LJicC+Lwx5oYxQMMwvEtETlHVi4IgYCVzRqpEIAzDc0TkuiSqTDR0EECXqu4XBMGfq7xXvS47zyVwyaj7F4DHAPzd8UEnGqPLMe/2BdABgCw+Rnl8HuYiGi4uxUlrP2SM6RbH+yHn6GXf9ztEhKSuNOVaByhzrmP8TgBPcmt3HKTx5jILwG4ADgHAcHknB+gTAMhXYqEtFbHWkmo0p1gszpcoik5SVdaL7jfGHJPKDDYehHHxDgCyZCUDYNRxPwCy5OgXV5Kc44UeBoAMu70cV4klX74MavrX0noWa+19AI4WkZMlDMOvO4LX5caYi9OaRMk4ZGiUkm9fohsC4E5XJCOopauGYO7iKIrkgNJdIXWcwntRQ7kESWNMRZLYnsQzamgSbp5ljPlhKjPYeBC6aORFlQpdEYJKLaW2JppKLZ4PgCQLWtb3lbGWeS/Wf7gHfzWtZ7HWfg7ADQxDqaGPkgWiqgubVICj20GNI1A8oJAIQaWBoqZyGb/u9knumdya+CerkYmQ8k2DygQweQO8byoShuERIvIw2SZiraU13ENE9vJ9PxXLWPaUTGDvAWCRMy6lCZvE6rOUy+w4yw+ke5OjT6ueCPdegv6w01BeG6aCJoAoivZQVWL3PAEds1CZTKazSek67n88BXIygGMB7Amg3YFBshYtNidLkDoBkIPql4HJWs+9zkN41mlzWniCRN5iscgV9SIB/S/PAeVyuXc1MeTkUqeWMll7iuNOJYCMOuvPJc/r6B4lWsy5kyvPfZM0IRqjhnL3K70lF4Jy/36NgJJvDmPMhKSHBr9yjk9/kqEvzy7xuAyXdabCuDxFQm+Amkvixa/ckRzy+ZsiCY4E9E2yItauXTtrwYIFPK3WTKEGkktEK04C7AfLDFUyNy5/ukcMAmi4GJikrpmlQJUCyje9o6ruFATBy81Es2TsAwFc6LYAhqTlQoNDl4oBCUFtqiKUL3nWRnb2PK+3Fc5KuqiJS56OOTWVJ0rKhUpAzbzbuUlVUQ0bpSzlRokWcu84jvdpMquOERAphHSJGFIy2c19tNIeSuvPExuPO8efCRFq7Zg9SFs2cpuiKHpEVQ9romPP508iIDrrNErMHtGdKo+gEqwYitIA0eVjlZaJEMbT48X+DcV4I8e+BUJPAkdXiCeTWcv6sPt7AgJB46liGp3tuT25497J/zNlxzB1udNYXpvqnloeeibJkaXGmEsa+ior35wJDlKvyY6m21QaAREs1rroFhEobgHUYBqtUjePTjWjKRbN6JMyH5qa1S9PjjQ7ffcdF8eXZo0IPVNxdNppyQkUAWX+k+k6JkaYsksiKl5P8Akqr2csT61NRTZK35UkmF/yfb+zCQlmJjS6yxIdjIBoaJK98TmXmiOA1FJq86lury0FjWEq43karG+lguZbNbm3E8wc1FrbzBJIuWUmmPQ86GfSx+T59vIIiM0G6Pgz61SepaJmMgRlSq3hskkJhCM2uUhXCijjdWaNuMST2LxSSZsR1XscoNRWAkyhO/Woy4cuaTiab2FXsUg3Vkamk2yM4R6VprCONNtl5RlSch/kUqcx4sqpVOOiQWIulI4/lz49BLpeXHo81cclvzSNh7DWMrhg6vHtMnIJ0eGNtra2zkZ3W0jjQdMYY1yig9tHZ6g4k3wL41JxHKDnksZIP26GLFYdsiVksfONMcTubed4hs5YHYjJVRPSGXnhDOG2elAnJNw69ymhhL+eyWR2aVKNqfqnatKVjhLOAiLZLgcYY55KplLp0MK9qnqsiFzp+/5FTZpzSw9b9aEFZ5xmjtVs5nWy8WEcx6xlVXesxi39sYNfInKX7/t0nGfEIZAc/AJwmzFmcTkwM0cTJ6EqW3w0scwvHSgUCvtO98OzbF6Ty+WYtGGZZnKHZwlo2fHuO40xbFM5baXm491uL2WHmGnfgCDJKNXUgCBRxTAMzxCRm6Zri4wwDNlsgCnB2ltkJKCWRAXTuYlLVcc1q+IzuTZDzPsxVxpms9lDOzs7GSlstRKGYSAizMDN5XGj7u7uE+vWZoiolTbCIpdIRBZuzY2wVJW1KZZX6t8IK1HDmVZtEy/IqpZ86W0qNBM80fd9Lo0pL1EUHayqP0utmWCCWGm7S8fSYLvL66Yyoq430zJa81TbXSagOUPFCfAkHGX5yMjIFybbHrLZL8FFQGzImvSlSr8haykIrpUb2+4yN8iWwWcHQUC+e8uLi80JJg9DrHMtg2+pZeKT3kMrDcZiv+d5tyRNrZmlAnBRq3oBrp3lFao61kKJ3cIALK5HL9S6AOomlY2iiKxjtl0nEYFt168TkaXd3d3kHTVdmGlXVbZdZy+7sTkCuNT3/ataqu162RZQ8cMAxWLx6p6eHpK4Upcp+WGAcpSiKOKxwcvYA8r9HxkgdJZvbGtrW9FoMsXQ0NC2xWIx+XTFwuQ8acmnK0hGq7vUbcmPNzP2gvI870JVJbkrOXrIpfaQqpIMttIY80ytrD9V9ay1e/NIjoiQmsPmKsl460VkeRzHy4Ig2NBjqe5olpFWG3H/DfccGBjYwfO809w3QnhcpvRl8hACNYYJ3OdVlZ//GeTnf2h9u7q6xth31Dp6E3Ec7xjHcbeIkM28u2tCwBVBJnQiGz7/E8fx7fl8/pWGPqC7ecM1tNJDOC7VMSJylKqSaMvODPWQISY0VPWBOI7vy+fzqXPumwJoOXJs0BfHcfIJtfnuE2qkhpN/T61MjtaQ7khtpea+KCJ9qrpaRJ71PO+pVmh8+H/1KRz3oxJ23gAAAABJRU5ErkJggg=="
                  data-v-1d1dd922=""
                />
              </div>
            </div>
            <!--v-if-->
          </div>
          <!--v-if--><!--v-if-->
        </div>
      </div>
    </div>
    <div class="el-overlay" style="z-index: 2014; display: none;">
      <div class="el-overlay-dialog">
        <div class="el-dialog fg-dialog" aria-modal="true" role="dialog" aria-label="dialog">
          <div class="el-dialog__header">
            <div class="fg-dialog-title" data-v-341c33a9="">
              <div class="left" data-v-341c33a9=""><span data-v-341c33a9="">ROI Calculator</span></div>
              <div class="right" data-v-341c33a9="">
                <img
                  class="close-img"
                  src="data:image/png;base64,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"
                  data-v-341c33a9=""
                />
              </div>
            </div>
            <!--v-if-->
          </div>
          <!--v-if--><!--v-if-->
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.stake-item .row1 {
  width: 100%;
  -webkit-box-pack: justify;
  -ms-flex-pack: justify;
  justify-content: space-between;
  background: #59a6f3;
  padding: 29px 34px 17px 30px;
  border-radius: 12px 12px 0 0;
}

.stake-item .pool-wrapper {
  border-radius: 0 0 12px 12px;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
  -ms-flex-direction: column;
  flex-direction: column;
  -webkit-box-align: center;
  -ms-flex-align: center;
  align-items: center;
  background: #fff;
  padding: 24px 28px 39px 28px;
}

.stake-item .pool-wrapper .row2 {
  cursor: pointer;
  width: 100%;
  -webkit-box-align: center;
  -ms-flex-align: center;
  align-items: center;
  -webkit-box-pack: justify;
  -ms-flex-pack: justify;
  justify-content: space-between;
  margin-top: 11px;
}

.stake-item .row1 .left {
  font-size: 16px;
  font-weight: 400;
  color: #fff;
}

.stake-item .row1 .left .top {
  font-size: 24px;
  font-weight: 600;
  color: #000;
}

.stake-item .pool-wrapper .row2 .lef,
.stake-item .pool-wrapper .row2 .right {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
  -ms-flex-align: center;
  align-items: center;
}

.stake-item .pool-wrapper .row3 {
  width: 100%;
  margin-top: 41px;
  -webkit-box-pack: justify;
  -ms-flex-pack: justify;
  justify-content: space-between;
}

.enable-contract {
  width: 100%;
  font-size: 18px;
  font-weight: 700;
  margin-top: 41px;
  color: #fff;
  padding: 15px 0;
  background: -webkit-gradient(linear, left top, right top, from(#1ec0d7), to(#3794f1));
  background: linear-gradient(90deg, #1ec0d7, #3794f1);
  border-radius: 10px;
}

.stake-item .stake-inner .row1 .right {
  font-size: 18px;
  font-weight: 400;
  color: #666;
}

.stake-item .row1 .right {
  -webkit-box-align: end;
  -ms-flex-align: end;
  align-items: flex-end;
}

.stake-item .pool-wrapper .sortIcon {
  -webkit-box-align: center;
  -ms-flex-align: center;
  align-items: center;
  border-radius: 16px;
  display: -webkit-inline-box;
  display: -ms-inline-flexbox;
  display: inline-flex;
  font-weight: 400;
  white-space: nowrap;
  height: 28px;
  line-height: 28px;
  padding: 0 8px;
  font-size: 14px;
  background: #faf9fa;
  margin-right: 8px;
}

.stake-item .pool-wrapper .row2 .right {
  font-size: 16px;
  font-weight: 600;
}
</style>
