Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 490ED4E61D
	for <lists+linux-rtc@lfdr.de>; Fri, 21 Jun 2019 12:34:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726462AbfFUKes (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 21 Jun 2019 06:34:48 -0400
Received: from lucky1.263xmail.com ([211.157.147.132]:37520 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726289AbfFUKes (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 21 Jun 2019 06:34:48 -0400
Received: from tony.xie?rock-chips.com (unknown [192.168.167.209])
        by lucky1.263xmail.com (Postfix) with ESMTP id 08F045683A;
        Fri, 21 Jun 2019 18:34:43 +0800 (CST)
X-263anti-spam: KSV:0;BIG:0;
X-MAIL-GRAY: 1
X-MAIL-DELIVERY: 0
X-KSVirus-check: 0
X-ADDR-CHECKED4: 1
X-ABS-CHECKED: 1
X-SKE-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from localhost.localdomain (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P15277T140572333438720S1561113280887162_;
        Fri, 21 Jun 2019 18:34:42 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <a36fbe699d367dd9b39e64f60b280e0c>
X-RL-SENDER: tony.xie@rock-chips.com
X-SENDER: xxx@rock-chips.com
X-LOGIN-NAME: tony.xie@rock-chips.com
X-FST-TO: heiko@sntech.de
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
From:   Tony Xie <tony.xie@rock-chips.com>
To:     heiko@sntech.de
Cc:     broonie@kernel.org, lee.jones@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, sboyd@kernel.org,
        linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, chenjh@rock-chips.com,
        xsf@rock-chips.com, zhangqing@rock-chips.com,
        huangtao@rock-chips.com, tony.xie@rock-chips.com
Subject: [PATCH v10 5/6] rtc: rk808: add RK809 and RK817 support.
Date:   Fri, 21 Jun 2019 06:34:38 -0400
Message-Id: <20190621103438.8237-1-tony.xie@rock-chips.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190621103258.8154-1-tony.xie@rock-chips.com>
References: <20190621103258.8154-1-tony.xie@rock-chips.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

RK809 and RK817 are power management IC chips for multimedia products.
Most of their functions and registers are same, including the rtc.

Signed-off-by: Tony Xie <tony.xie@rock-chips.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/Kconfig     |  4 +--
 drivers/rtc/rtc-rk808.c | 68 ++++++++++++++++++++++++++++++++---------
 2 files changed, 56 insertions(+), 16 deletions(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index a819ef07b7ec..8c34f7ec0a59 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -363,11 +363,11 @@ config RTC_DRV_MAX77686
 	  will be called rtc-max77686.
 
 config RTC_DRV_RK808
-	tristate "Rockchip RK805/RK808/RK818 RTC"
+	tristate "Rockchip RK805/RK808/RK809/RK817/RK818 RTC"
 	depends on MFD_RK808
 	help
 	  If you say yes here you will get support for the
-	  RTC of RK805, RK808 and RK818 PMIC.
+	  RTC of RK805, RK809 and RK817, RK808 and RK818 PMIC.
 
 	  This driver can also be built as a module. If so, the module
 	  will be called rk808-rtc.
diff --git a/drivers/rtc/rtc-rk808.c b/drivers/rtc/rtc-rk808.c
index 739c0d42e835..5bacdafb7b21 100644
--- a/drivers/rtc/rtc-rk808.c
+++ b/drivers/rtc/rtc-rk808.c
@@ -50,9 +50,18 @@
 #define NUM_TIME_REGS	(RK808_WEEKS_REG - RK808_SECONDS_REG + 1)
 #define NUM_ALARM_REGS	(RK808_ALARM_YEARS_REG - RK808_ALARM_SECONDS_REG + 1)
 
+struct rk_rtc_compat_reg {
+	unsigned int ctrl_reg;
+	unsigned int status_reg;
+	unsigned int alarm_seconds_reg;
+	unsigned int int_reg;
+	unsigned int seconds_reg;
+};
+
 struct rk808_rtc {
 	struct rk808 *rk808;
 	struct rtc_device *rtc;
+	struct rk_rtc_compat_reg *creg;
 	int irq;
 };
 
@@ -101,7 +110,7 @@ static int rk808_rtc_readtime(struct device *dev, struct rtc_time *tm)
 	int ret;
 
 	/* Force an update of the shadowed registers right now */
-	ret = regmap_update_bits(rk808->regmap, RK808_RTC_CTRL_REG,
+	ret = regmap_update_bits(rk808->regmap, rk808_rtc->creg->ctrl_reg,
 				 BIT_RTC_CTRL_REG_RTC_GET_TIME,
 				 BIT_RTC_CTRL_REG_RTC_GET_TIME);
 	if (ret) {
@@ -115,7 +124,7 @@ static int rk808_rtc_readtime(struct device *dev, struct rtc_time *tm)
 	 * 32khz. If we clear the GET_TIME bit here, the time of i2c transfer
 	 * certainly more than 31.25us: 16 * 2.5us at 400kHz bus frequency.
 	 */
-	ret = regmap_update_bits(rk808->regmap, RK808_RTC_CTRL_REG,
+	ret = regmap_update_bits(rk808->regmap, rk808_rtc->creg->ctrl_reg,
 				 BIT_RTC_CTRL_REG_RTC_GET_TIME,
 				 0);
 	if (ret) {
@@ -123,7 +132,7 @@ static int rk808_rtc_readtime(struct device *dev, struct rtc_time *tm)
 		return ret;
 	}
 
-	ret = regmap_bulk_read(rk808->regmap, RK808_SECONDS_REG,
+	ret = regmap_bulk_read(rk808->regmap, rk808_rtc->creg->seconds_reg,
 			       rtc_data, NUM_TIME_REGS);
 	if (ret) {
 		dev_err(dev, "Failed to bulk read rtc_data: %d\n", ret);
@@ -166,7 +175,7 @@ static int rk808_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	rtc_data[6] = bin2bcd(tm->tm_wday);
 
 	/* Stop RTC while updating the RTC registers */
-	ret = regmap_update_bits(rk808->regmap, RK808_RTC_CTRL_REG,
+	ret = regmap_update_bits(rk808->regmap, rk808_rtc->creg->ctrl_reg,
 				 BIT_RTC_CTRL_REG_STOP_RTC_M,
 				 BIT_RTC_CTRL_REG_STOP_RTC_M);
 	if (ret) {
@@ -174,14 +183,14 @@ static int rk808_rtc_set_time(struct device *dev, struct rtc_time *tm)
 		return ret;
 	}
 
-	ret = regmap_bulk_write(rk808->regmap, RK808_SECONDS_REG,
+	ret = regmap_bulk_write(rk808->regmap, rk808_rtc->creg->seconds_reg,
 				rtc_data, NUM_TIME_REGS);
 	if (ret) {
 		dev_err(dev, "Failed to bull write rtc_data: %d\n", ret);
 		return ret;
 	}
 	/* Start RTC again */
-	ret = regmap_update_bits(rk808->regmap, RK808_RTC_CTRL_REG,
+	ret = regmap_update_bits(rk808->regmap, rk808_rtc->creg->ctrl_reg,
 				 BIT_RTC_CTRL_REG_STOP_RTC_M, 0);
 	if (ret) {
 		dev_err(dev, "Failed to update RTC control: %d\n", ret);
@@ -199,8 +208,13 @@ static int rk808_rtc_readalarm(struct device *dev, struct rtc_wkalrm *alrm)
 	uint32_t int_reg;
 	int ret;
 
-	ret = regmap_bulk_read(rk808->regmap, RK808_ALARM_SECONDS_REG,
+	ret = regmap_bulk_read(rk808->regmap,
+			       rk808_rtc->creg->alarm_seconds_reg,
 			       alrm_data, NUM_ALARM_REGS);
+	if (ret) {
+		dev_err(dev, "Failed to read RTC alarm date REG: %d\n", ret);
+		return ret;
+	}
 
 	alrm->time.tm_sec = bcd2bin(alrm_data[0] & SECONDS_REG_MSK);
 	alrm->time.tm_min = bcd2bin(alrm_data[1] & MINUTES_REG_MAK);
@@ -210,7 +224,7 @@ static int rk808_rtc_readalarm(struct device *dev, struct rtc_wkalrm *alrm)
 	alrm->time.tm_year = (bcd2bin(alrm_data[5] & YEARS_REG_MSK)) + 100;
 	rockchip_to_gregorian(&alrm->time);
 
-	ret = regmap_read(rk808->regmap, RK808_RTC_INT_REG, &int_reg);
+	ret = regmap_read(rk808->regmap, rk808_rtc->creg->int_reg, &int_reg);
 	if (ret) {
 		dev_err(dev, "Failed to read RTC INT REG: %d\n", ret);
 		return ret;
@@ -231,7 +245,7 @@ static int rk808_rtc_stop_alarm(struct rk808_rtc *rk808_rtc)
 	struct rk808 *rk808 = rk808_rtc->rk808;
 	int ret;
 
-	ret = regmap_update_bits(rk808->regmap, RK808_RTC_INT_REG,
+	ret = regmap_update_bits(rk808->regmap, rk808_rtc->creg->int_reg,
 				 BIT_RTC_INTERRUPTS_REG_IT_ALARM_M, 0);
 
 	return ret;
@@ -242,7 +256,7 @@ static int rk808_rtc_start_alarm(struct rk808_rtc *rk808_rtc)
 	struct rk808 *rk808 = rk808_rtc->rk808;
 	int ret;
 
-	ret = regmap_update_bits(rk808->regmap, RK808_RTC_INT_REG,
+	ret = regmap_update_bits(rk808->regmap, rk808_rtc->creg->int_reg,
 				 BIT_RTC_INTERRUPTS_REG_IT_ALARM_M,
 				 BIT_RTC_INTERRUPTS_REG_IT_ALARM_M);
 
@@ -274,7 +288,8 @@ static int rk808_rtc_setalarm(struct device *dev, struct rtc_wkalrm *alrm)
 	alrm_data[4] = bin2bcd(alrm->time.tm_mon + 1);
 	alrm_data[5] = bin2bcd(alrm->time.tm_year - 100);
 
-	ret = regmap_bulk_write(rk808->regmap, RK808_ALARM_SECONDS_REG,
+	ret = regmap_bulk_write(rk808->regmap,
+				rk808_rtc->creg->alarm_seconds_reg,
 				alrm_data, NUM_ALARM_REGS);
 	if (ret) {
 		dev_err(dev, "Failed to bulk write: %d\n", ret);
@@ -318,7 +333,7 @@ static irqreturn_t rk808_alarm_irq(int irq, void *data)
 	struct i2c_client *client = rk808->i2c;
 	int ret;
 
-	ret = regmap_write(rk808->regmap, RK808_RTC_STATUS_REG,
+	ret = regmap_write(rk808->regmap, rk808_rtc->creg->status_reg,
 			   RTC_STATUS_MASK);
 	if (ret) {
 		dev_err(&client->dev,
@@ -371,6 +386,22 @@ static int rk808_rtc_resume(struct device *dev)
 static SIMPLE_DEV_PM_OPS(rk808_rtc_pm_ops,
 	rk808_rtc_suspend, rk808_rtc_resume);
 
+static struct rk_rtc_compat_reg rk808_creg = {
+	.ctrl_reg = RK808_RTC_CTRL_REG,
+	.status_reg = RK808_RTC_STATUS_REG,
+	.alarm_seconds_reg = RK808_ALARM_SECONDS_REG,
+	.int_reg = RK808_RTC_INT_REG,
+	.seconds_reg = RK808_SECONDS_REG,
+};
+
+static struct rk_rtc_compat_reg rk817_creg = {
+	.ctrl_reg = RK817_RTC_CTRL_REG,
+	.status_reg = RK817_RTC_STATUS_REG,
+	.alarm_seconds_reg = RK817_ALARM_SECONDS_REG,
+	.int_reg = RK817_RTC_INT_REG,
+	.seconds_reg = RK817_SECONDS_REG,
+};
+
 static int rk808_rtc_probe(struct platform_device *pdev)
 {
 	struct rk808 *rk808 = dev_get_drvdata(pdev->dev.parent);
@@ -381,11 +412,20 @@ static int rk808_rtc_probe(struct platform_device *pdev)
 	if (rk808_rtc == NULL)
 		return -ENOMEM;
 
+	switch (rk808->variant) {
+	case RK809_ID:
+	case RK817_ID:
+		rk808_rtc->creg = &rk817_creg;
+		break;
+	default:
+		rk808_rtc->creg = &rk808_creg;
+		break;
+	}
 	platform_set_drvdata(pdev, rk808_rtc);
 	rk808_rtc->rk808 = rk808;
 
 	/* start rtc running by default, and use shadowed timer. */
-	ret = regmap_update_bits(rk808->regmap, RK808_RTC_CTRL_REG,
+	ret = regmap_update_bits(rk808->regmap, rk808_rtc->creg->ctrl_reg,
 				 BIT_RTC_CTRL_REG_STOP_RTC_M |
 				 BIT_RTC_CTRL_REG_RTC_READSEL_M,
 				 BIT_RTC_CTRL_REG_RTC_READSEL_M);
@@ -395,7 +435,7 @@ static int rk808_rtc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = regmap_write(rk808->regmap, RK808_RTC_STATUS_REG,
+	ret = regmap_write(rk808->regmap, rk808_rtc->creg->status_reg,
 			   RTC_STATUS_MASK);
 	if (ret) {
 		dev_err(&pdev->dev,
-- 
2.17.1



