Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8AF62A5F6C
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Sep 2019 04:41:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727074AbfICClC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 2 Sep 2019 22:41:02 -0400
Received: from inva020.nxp.com ([92.121.34.13]:34900 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726450AbfICClB (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 2 Sep 2019 22:41:01 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 3261F1A099C;
        Tue,  3 Sep 2019 04:40:58 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 376361A0724;
        Tue,  3 Sep 2019 04:40:53 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 37002402BE;
        Tue,  3 Sep 2019 10:40:47 +0800 (SGT)
From:   Biwen Li <biwen.li@nxp.com>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        robh+dt@kernel.org, mark.rutland@arm.com, leoyang.li@nxp.com
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Biwen Li <biwen.li@nxp.com>,
        Martin Fuzzey <mfuzzey@parkeon.com>
Subject: [v2,2/2] rtc: pcf85263/pcf85363: support PM, wakeup device, improve performance
Date:   Tue,  3 Sep 2019 10:30:38 +0800
Message-Id: <20190903023038.16921-2-biwen.li@nxp.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20190903023038.16921-1-biwen.li@nxp.com>
References: <20190903023038.16921-1-biwen.li@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Add some features as follow:
    - Set quartz oscillator load capacitance by DT
      (generate more accuracy frequency)
    - Set quartz oscillator drive control by DT
      (reduce/increase the current consumption)
    - Set low jitter mode by DT
      (improve jitter performance)
    - Set wakeup source by DT
      (wakeup device from suspend
    - Select interrupt output pin by DT
      (INTA/TS(INTB))
    - Add power management
    - Add ioctl to check rtc status
      (check whether oscillator of pcf85263/pcf85363 is stopped)

Datasheet url:
    - https://www.nxp.com/docs/en/data-sheet/PCF85263A.pdf
    - https://www.nxp.com/docs/en/data-sheet/PCF85363A.pdf

Signed-off-by: Martin Fuzzey <mfuzzey@parkeon.com>
Signed-off-by: Biwen Li <biwen.li@nxp.com>
---
Change in v2:
	- Replace properties name
	  quartz-load-capacitance -> quartz-load-femtofarads
	  quartz-drive-strength -> nxp,quartz-drive-strength
	  quartz-low-jitter -> nxp,quartz-low-jitter
	- Set default interrupt-output-pin as "INTA"

 drivers/rtc/rtc-pcf85363.c | 278 +++++++++++++++++++++++++++++++++++--
 1 file changed, 265 insertions(+), 13 deletions(-)

diff --git a/drivers/rtc/rtc-pcf85363.c b/drivers/rtc/rtc-pcf85363.c
index 3450d615974d..030da4e764eb 100644
--- a/drivers/rtc/rtc-pcf85363.c
+++ b/drivers/rtc/rtc-pcf85363.c
@@ -18,6 +18,16 @@
 #include <linux/of_device.h>
 #include <linux/regmap.h>
 
+/* Quartz capacitance */
+#define PCF85363_QUARTZCAP_7pF		0
+#define PCF85363_QUARTZCAP_6pF		1
+#define PCF85363_QUARTZCAP_12p5pF	2
+
+/* Quartz drive strength */
+#define PCF85363_QUARTZDRIVE_100ko	0
+#define PCF85363_QUARTZDRIVE_60ko	1
+#define PCF85363_QUARTZDRIVE_500ko	2
+
 /*
  * Date/Time registers
  */
@@ -96,10 +106,20 @@
 #define FLAGS_PIF	BIT(7)
 
 #define PIN_IO_INTAPM	GENMASK(1, 0)
-#define PIN_IO_INTA_CLK	0
-#define PIN_IO_INTA_BAT	1
-#define PIN_IO_INTA_OUT	2
-#define PIN_IO_INTA_HIZ	3
+#define PIN_IO_INTAPM_SHIFT	0
+#define PIN_IO_INTA_CLK	(0 << PIN_IO_INTAPM_SHIFT)
+#define PIN_IO_INTA_BAT	(1 << PIN_IO_INTAPM_SHIFT)
+#define PIN_IO_INTA_OUT	(2 << PIN_IO_INTAPM_SHIFT)
+#define PIN_IO_INTA_HIZ	(3 << PIN_IO_INTAPM_SHIFT)
+
+#define PIN_IO_TSPM	 GENMASK(3, 2)
+#define PIN_IO_TSPM_SHIFT	2
+#define PIN_IO_TS_DISABLE	(0x0 << PIN_IO_TSPM_SHIFT)
+#define PIN_IO_TS_INTB_OUT	(0x1 << PIN_IO_TSPM_SHIFT)
+#define PIN_IO_TS_CLK_OUT	(0x2 << PIN_IO_TSPM_SHIFT)
+#define PIN_IO_TS_IN	(0x3 << PIN_IO_TSPM_SHIFT)
+
+#define PIN_IO_CLKPM	BIT(7) /* 0 = enable CLK pin,1 = disable CLK pin */
 
 #define STOP_EN_STOP	BIT(0)
 
@@ -107,9 +127,33 @@
 
 #define NVRAM_SIZE	0x40
 
+#define DT_SECS_OS BIT(7)
+
+#define CTRL_OSCILLATOR_CL_MASK	GENMASK(1, 0)
+#define CTRL_OSCILLATOR_CL_SHIFT	0
+#define CTRL_OSCILLATOR_OSCD_MASK	GENMASK(3, 2)
+#define CTRL_OSCILLATOR_OSCD_SHIFT	2
+#define CTRL_OSCILLATOR_LOWJ		BIT(4)
+
+#define CTRL_FUNCTION_COF_OFF	0x7 /* No clock output */
+
+enum pcf85363_irqpin {
+	IRQPIN_INTA,
+	IRQPIN_INTB
+};
+
+static const char *const pcf85363_irqpin_names[] = {
+	[IRQPIN_INTA] = "INTA",
+	[IRQPIN_INTB] = "INTB"
+};
+
+
 struct pcf85363 {
+	struct device *dev;
 	struct rtc_device	*rtc;
 	struct regmap		*regmap;
+	enum pcf85363_irqpin irq_pin;
+	int irq;
 };
 
 struct pcf85x63_config {
@@ -210,14 +254,26 @@ static int _pcf85363_rtc_alarm_irq_enable(struct pcf85363 *pcf85363, unsigned
 {
 	unsigned int alarm_flags = ALRM_SEC_A1E | ALRM_MIN_A1E | ALRM_HR_A1E |
 				   ALRM_DAY_A1E | ALRM_MON_A1E;
-	int ret;
+	int ret, reg;
 
 	ret = regmap_update_bits(pcf85363->regmap, DT_ALARM_EN, alarm_flags,
 				 enabled ? alarm_flags : 0);
 	if (ret)
 		return ret;
 
-	ret = regmap_update_bits(pcf85363->regmap, CTRL_INTA_EN,
+	switch (pcf85363->irq_pin) {
+	case IRQPIN_INTA:
+		reg = CTRL_INTA_EN;
+		break;
+
+	case IRQPIN_INTB:
+		reg = CTRL_INTB_EN;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+	ret = regmap_update_bits(pcf85363->regmap, reg,
 				 INT_A1IE, enabled ? INT_A1IE : 0);
 
 	if (ret || enabled)
@@ -282,12 +338,55 @@ static irqreturn_t pcf85363_rtc_handle_irq(int irq, void *dev_id)
 	return IRQ_NONE;
 }
 
+static int pcf85363_osc_is_stopped(struct pcf85363 *pcf85363)
+{
+	unsigned int regval;
+	int ret;
+
+	ret = regmap_read(pcf85363->regmap, DT_SECS, &regval);
+	if (ret)
+		return ret;
+
+	ret = regval & DT_SECS_OS ? 1 : 0;
+	if (ret)
+		dev_warn(pcf85363->dev, "Oscillator stop detected, date/time is not reliable.\n");
+
+	return ret;
+}
+
+static int pcf85363_ioctl(struct device *dev,
+			  unsigned int cmd, unsigned long arg)
+{
+	struct pcf85363 *pcf85363 = dev_get_drvdata(dev);
+	int ret;
+
+	switch (cmd) {
+	case RTC_VL_READ:
+		ret = pcf85363_osc_is_stopped(pcf85363);
+		if (ret < 0)
+			return ret;
+
+		if (copy_to_user((void __user *)arg, &ret, sizeof(int)))
+			return -EFAULT;
+		return 0;
+
+	case RTC_VL_CLR:
+		return regmap_update_bits(pcf85363->regmap,
+					  DT_SECS,
+					  DT_SECS_OS, 0);
+	default:
+		return -ENOIOCTLCMD;
+	}
+}
+
 static const struct rtc_class_ops rtc_ops = {
+	.ioctl = pcf85363_ioctl,
 	.read_time	= pcf85363_rtc_read_time,
 	.set_time	= pcf85363_rtc_set_time,
 };
 
 static const struct rtc_class_ops rtc_ops_alarm = {
+	.ioctl = pcf85363_ioctl,
 	.read_time	= pcf85363_rtc_read_time,
 	.set_time	= pcf85363_rtc_set_time,
 	.read_alarm	= pcf85363_rtc_read_alarm,
@@ -355,6 +454,107 @@ static const struct pcf85x63_config pcf_85363_config = {
 	.num_nvram = 2
 };
 
+/*
+ * On some boards the interrupt line may not be wired to the CPU but only to
+ * a power supply circuit.
+ * In that case no interrupt will be specified in the device tree but the
+ * wakeup-source DT property may be used to enable wakeup programming in
+ * sysfs
+ */
+static bool pcf85363_can_wakeup_machine(struct pcf85363 *pcf85363)
+{
+	return pcf85363->irq ||
+		of_property_read_bool(pcf85363->dev->of_node, "wakeup-source");
+}
+
+static int pcf85363_init_hw(struct pcf85363 *pcf85363)
+{
+	struct device_node *np = pcf85363->dev->of_node;
+	unsigned int regval;
+	u32 propval;
+	int ret;
+
+	/* Determine if oscilator has been stopped (probably low power) */
+	ret = pcf85363_osc_is_stopped(pcf85363);
+	if (ret < 0) {
+		/* Log here since this is the first hw access on probe */
+		dev_err(pcf85363->dev, "Unable to read register\n");
+
+		return ret;
+	}
+
+	ret = regmap_read(pcf85363->regmap, CTRL_OSCILLATOR, &regval);
+	if (ret)
+		return ret;
+
+	/* Set oscilator register */
+	propval = PCF85363_QUARTZCAP_12p5pF;
+	of_property_read_u32(np, "quartz-load-femtofarads", &propval);
+	regval |= ((propval << CTRL_OSCILLATOR_CL_SHIFT)
+		    & CTRL_OSCILLATOR_CL_MASK);
+
+	propval = PCF85363_QUARTZDRIVE_NORMAL;
+	of_property_read_u32(np, "nxp,quartz-drive-strength", &propval);
+	regval |= ((propval << CTRL_OSCILLATOR_OSCD_SHIFT)
+		    & CTRL_OSCILLATOR_OSCD_MASK);
+
+	if (of_property_read_bool(np, "nxp,quartz-low-jitter"))
+		regval |= CTRL_OSCILLATOR_LOWJ;
+
+	ret = regmap_write(pcf85363->regmap, CTRL_OSCILLATOR, regval);
+	if (ret)
+		return ret;
+
+	/* Set function register
+	 * (100th second disabled
+	 * no periodic interrupt
+	 * real-time clock mode
+	 * RTC stop is controlled by STOP bit only
+	 * no clock output)
+	 */
+	ret = regmap_write(pcf85363->regmap, CTRL_FUNCTION,
+			   CTRL_FUNCTION_COF_OFF);
+	if (ret)
+		return ret;
+
+	/* Set all interrupts to disabled, level mode */
+	ret = regmap_write(pcf85363->regmap, CTRL_INTA_EN,
+			   INT_ILP);
+	if (ret)
+		return ret;
+	ret = regmap_write(pcf85363->regmap, CTRL_INTB_EN,
+			   INT_ILP);
+	if (ret)
+		return ret;
+
+	/* Determine which interrupt pin the board uses */
+	pcf85363->irq_pin = IRQPIN_INTA;
+	if (pcf85363_can_wakeup_machine(pcf85363)) {
+		if (of_property_match_string(pcf85363->dev->of_node,
+					     "interrupt-output-pin",
+					     "INTB") >= 0)
+			pcf85363->irq_pin = IRQPIN_INTB;
+	}
+
+	/* Setup IO pin config register */
+	regval = PIN_IO_CLKPM; /* disable CLK pin*/
+	switch (pcf85363->irq_pin) {
+	case IRQPIN_INTA:
+		regval |= (PIN_IO_INTA_OUT | PIN_IO_TS_DISABLE);
+		break;
+	case IRQPIN_INTB:
+		regval |= (PIN_IO_INTA_HIZ | PIN_IO_TS_INTB_OUT);
+		break;
+	default:
+		dev_err(pcf85363->dev, "Failed to set interrupt out pin\n");
+		return -EINVAL;
+	}
+	ret = regmap_write(pcf85363->regmap, CTRL_PIN_IO, regval);
+
+	return ret;
+}
+
+
 static int pcf85363_probe(struct i2c_client *client,
 			  const struct i2c_device_id *id)
 {
@@ -394,9 +594,11 @@ static int pcf85363_probe(struct i2c_client *client,
 		return PTR_ERR(pcf85363->regmap);
 	}
 
+	pcf85363->irq = client->irq;
+	pcf85363->dev = &client->dev;
 	i2c_set_clientdata(client, pcf85363);
 
-	pcf85363->rtc = devm_rtc_allocate_device(&client->dev);
+	pcf85363->rtc = devm_rtc_allocate_device(pcf85363->dev);
 	if (IS_ERR(pcf85363->rtc))
 		return PTR_ERR(pcf85363->rtc);
 
@@ -404,20 +606,28 @@ static int pcf85363_probe(struct i2c_client *client,
 	pcf85363->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
 	pcf85363->rtc->range_max = RTC_TIMESTAMP_END_2099;
 
-	if (client->irq > 0) {
+	ret = pcf85363_init_hw(pcf85363);
+	if (ret)
+		return ret;
+
+	if (pcf85363->irq > 0) {
 		regmap_write(pcf85363->regmap, CTRL_FLAGS, 0);
-		regmap_update_bits(pcf85363->regmap, CTRL_PIN_IO,
-				   PIN_IO_INTA_OUT, PIN_IO_INTAPM);
-		ret = devm_request_threaded_irq(&client->dev, client->irq,
+		ret = devm_request_threaded_irq(pcf85363->dev, pcf85363->irq,
 						NULL, pcf85363_rtc_handle_irq,
-						IRQF_TRIGGER_LOW | IRQF_ONESHOT,
+						IRQF_TRIGGER_FALLING |
+						IRQF_ONESHOT,
 						"pcf85363", client);
-		if (ret)
+		if (ret) {
 			dev_warn(&client->dev, "unable to request IRQ, alarms disabled\n");
+			pcf85363->irq = 0;
+		}
 		else
 			pcf85363->rtc->ops = &rtc_ops_alarm;
 	}
 
+	if (pcf85363_can_wakeup_machine(pcf85363))
+		device_init_wakeup(pcf85363->dev, true);
+
 	ret = rtc_register_device(pcf85363->rtc);
 
 	for (i = 0; i < config->num_nvram; i++) {
@@ -425,6 +635,10 @@ static int pcf85363_probe(struct i2c_client *client,
 		rtc_nvmem_register(pcf85363->rtc, &nvmem_cfg[i]);
 	}
 
+	/* We cannot support UIE mode if we do not have an IRQ line */
+	if (!pcf85363->irq)
+		pcf85363->rtc->uie_unsupported = 1;
+
 	return ret;
 }
 
@@ -435,12 +649,50 @@ static const struct of_device_id dev_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, dev_ids);
 
+static int pcf85363_remove(struct i2c_client *client)
+{
+	struct pcf85363 *pcf85363 = i2c_get_clientdata(client);
+
+	if (pcf85363_can_wakeup_machine(pcf85363))
+		device_init_wakeup(pcf85363->dev, false);
+
+	return 0;
+}
+
+#ifdef CONFIG_PM_SLEEP
+static int pcf85363_suspend(struct device *dev)
+{
+	struct pcf85363 *pcf85363 = dev_get_drvdata(dev);
+	int ret = 0;
+
+	if (device_may_wakeup(dev))
+		ret = enable_irq_wake(pcf85363->irq);
+
+	return ret;
+}
+
+static int pcf85363_resume(struct device *dev)
+{
+	struct pcf85363 *pcf85363 = dev_get_drvdata(dev);
+	int ret = 0;
+
+	if (device_may_wakeup(dev))
+		ret = disable_irq_wake(pcf85363->irq);
+
+	return ret;
+}
+#endif
+
+static SIMPLE_DEV_PM_OPS(pcf85363_pm_ops, pcf85363_suspend,  pcf85363_resume);
+
 static struct i2c_driver pcf85363_driver = {
 	.driver	= {
 		.name	= "pcf85363",
 		.of_match_table = of_match_ptr(dev_ids),
+		.pm = &pcf85363_pm_ops,
 	},
 	.probe	= pcf85363_probe,
+	.remove	= pcf85363_remove,
 };
 
 module_i2c_driver(pcf85363_driver);
-- 
2.17.1

