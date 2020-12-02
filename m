Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 173892CBB57
	for <lists+linux-rtc@lfdr.de>; Wed,  2 Dec 2020 12:15:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729604AbgLBLOW (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 2 Dec 2020 06:14:22 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:47378 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729601AbgLBLOV (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 2 Dec 2020 06:14:21 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20201202111329euoutp026296e91ed4b4e8d08f1a87d39cc3785e~M4fT7cZyx1464814648euoutp02R
        for <linux-rtc@vger.kernel.org>; Wed,  2 Dec 2020 11:13:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20201202111329euoutp026296e91ed4b4e8d08f1a87d39cc3785e~M4fT7cZyx1464814648euoutp02R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1606907609;
        bh=jTE/5TlH7r5bEbbuRbnmUFGZRSeaoxxMfiR/QX3kpcg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aZPKMlcINOCGr5vBIAI8wd6TyrDhpHqtQQ86w/SkmwJrvOypox/wfNi6uA7+7e2mu
         +TalQln0D8VNuOgCRzK4qEYUhhtQWijSNdUB1s1/1t0aaPSs/ZSYSYA3T5JEotoQ7U
         xm7wBjXK2xof23yUP5uq8x+n5Hb36r5EkoxHkd/g=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20201202111329eucas1p109471ea74f1762955baaf83aeba967ad~M4fTrTzc50205202052eucas1p1B;
        Wed,  2 Dec 2020 11:13:29 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 40.33.45488.8D677CF5; Wed,  2
        Dec 2020 11:13:28 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20201202111328eucas1p1e6fff3706b790d104b76f95085dbb0c1~M4fTH3na51250912509eucas1p13;
        Wed,  2 Dec 2020 11:13:28 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20201202111328eusmtrp2e62a86aa6cb7ea8736a49f0ddd285809~M4fTHJVss2918929189eusmtrp2g;
        Wed,  2 Dec 2020 11:13:28 +0000 (GMT)
X-AuditID: cbfec7f5-c77ff7000000b1b0-39-5fc776d8f14f
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id B2.CF.21957.8D677CF5; Wed,  2
        Dec 2020 11:13:28 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20201202111328eusmtip145f6f2e39106641bd754b78e2c8e47ed~M4fSshUGC1196811968eusmtip1r;
        Wed,  2 Dec 2020 11:13:28 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-rtc@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 2/2] rtc: s3c: Remove dead code related to periodic tick
 handling
Date:   Wed,  2 Dec 2020 12:13:18 +0100
Message-Id: <20201202111318.5353-2-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201202111318.5353-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSWUwTURTN6wwz08biWDBeFCUh2sQNNECsG+ISLR8aFwzGRGsDY0ELQgfc
        iEuoayUKKKVCgqhsQqFQVokSIEDFhVZFQAJG/ChCpAERg2haGQf175xzz7kn9+VRmMSBz6ei
        YxMYTaxS7UuI8Jq2H9aVPSctilW1n2SyvNfvSNlVRwEpqzCY3GRWazkpayvpJGQGa4NAVtrS
        T4aQ8hxjktxcfJ2Q36wqRvLMnB8C+bh50W63g6INkYw6+iSj8Q8+Iorqbehxi9PvOm0eykUX
        UUGIDgkpoANBm5GCdEhESegiBLaaXpwn3xD0D+hInowjyKjMQ38jrpQJgh8UInA6PqB/EW16
        Jcm5CHo16EZ0BIc96RCY+DXyZy9GOxA8KTVOE4ryoPdB3ns158HpJWBIe45zWExvgDJTN863
        +UBJeSPG2YX0RqjtjOPWAH2XgoH+hzOebXBZpyd57AHDlqoZ7A2ux/cEfECLYKCjlORJCoK3
        yYaZe9ZDX8cUwTVg9FIw1fvz8mZod5pITgbaHXpG5nAyNg3TazIxXhbDtSsS3i2FLEvZv9om
        2xuMx3K4UT2B8e+TiiB7MlmQinyy/pflIlSM5jGJbIyKYQNimVN+rDKGTYxV+UWciDGj6S/x
        wmmZqENFw2N+zUhAoWYEFObrKcadLQqJOFJ55iyjOaHQJKoZthktoHDfeeL6aqNCQquUCcxx
        holjNH+nAko4/6Ig9GFo3WFFq3VR46Gg9Env/cOWq6O35BGWwIidCx/9PLB1qdgVfy/X/1TK
        bFYvCFPd188aDugo83C7rMgbWxzikt4Ptu9bY0Qex6xHyxOFzIe+waBv28+R0sKhBeFp+qBZ
        e5eXBTxd9yXV61xG9ZyXD3aJ2omPpytWfNZ8jXfPcLV7ebkG+rXanDvMcZ+67JvejsG4wu7J
        rbfzE0p6vxc82237uuPVR2VroUq5Zs+e5vhPa7vUl1rsRPR2Mzn6+pI9n62d6pTaztp+SVMv
        bGkTJ4EuoClJ+9k+O7zSlG90+kzGp20jR3uLwjZ1jZHn8xtbWscrQDh375Ubdl1g5KuuQV+c
        jVKuXoZpWOVvkPotGYEDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLLMWRmVeSWpSXmKPExsVy+t/xu7o3yo7HG5x8LGGx5OJVdov2d8vY
        LTbOWM9qcf78BnaLY6uvsFnMOL+PyWLtkbvsDuwe89ZUe2xa1cnm0bdlFaPH9Hk/mTw+b5IL
        YI3SsynKLy1JVcjILy6xVYo2tDDSM7S00DMysdQzNDaPtTIyVdK3s0lJzcksSy3St0vQy7i1
        7wZrwTS/ik0vFzA2MC5z6GLk5JAQMJH43/OVrYuRi0NIYCmjxK197awQCRmJk9MaoGxhiT/X
        uqCKPjFKXFq/jBkkwSZgKNH1FiTBwSEi4CRx8HICSA2zwAdGic1/doDFhQUCJW5PLgEpZxFQ
        lZgx8RQLiM0rYCOxbv11Foj58hKrNxxgBinnFLCV2H6lACQsBFKy4Sf7BEa+BYwMqxhFUkuL
        c9Nziw31ihNzi0vz0vWS83M3MQLDdduxn5t3MM579VHvECMTB+MhRgkOZiURXpZ/R+KFeFMS
        K6tSi/Lji0pzUosPMZoCnTGRWUo0OR8YMXkl8YZmBqaGJmaWBqaWZsZK4rxb566JFxJITyxJ
        zU5NLUgtgulj4uCUamDy9O/fum3P9tPPtslu9Wis5m4u2c25aMcZz1IXjwtCva6C6kJcV3vt
        py3/nLHN4PdGE7ZonjVKt77ZdG1rNFjO/HTFT2kOsXC5+qy7u25PvLXMQyZxQot98/LWLTWP
        dqa/yNr0eVOknTrH27kh18/t7lig+Yp9+bdj55dNXO21Iu/R9/yVCR+Pz00XkP9/OGDuR+2p
        E96c+V5Vq/zfKGKx/6myBU8jzgu5h0jNulK8NZfd6Kxk55faWtH4/ZUr6z6tLVvxc/mz59Nv
        1BsGT2U9/OtqrKy+W9SPkou7+o5/2bb69cqXFcEyDI+rjs6dvtL25U8n82X3jTcyWh9I7Ezq
        eZknfOLRyT8ZM+saM2tXLFFiKc5INNRiLipOBADtkFUZ4AIAAA==
X-CMS-MailID: 20201202111328eucas1p1e6fff3706b790d104b76f95085dbb0c1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201202111328eucas1p1e6fff3706b790d104b76f95085dbb0c1
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201202111328eucas1p1e6fff3706b790d104b76f95085dbb0c1
References: <20201202111318.5353-1-m.szyprowski@samsung.com>
        <CGME20201202111328eucas1p1e6fff3706b790d104b76f95085dbb0c1@eucas1p1.samsung.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Support for periodic tick interrupts has been moved from the RTC class to
the HR-timers long time ago. Then it has been removed from this driver by
commits 80d4bb515b78 ("RTC: Cleanup rtc_class_ops->irq_set_state") and
696160fec162 ("RTC: Cleanup rtc_class_ops->irq_set_freq()"). They however
did not remove all the code related to the tick handling. Do it now then.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/rtc/rtc-s3c.c | 226 +-----------------------------------------
 1 file changed, 2 insertions(+), 224 deletions(-)

diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index 16a326e95d46..fab326ba9cec 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -42,26 +42,15 @@ struct s3c_rtc {
 	const struct s3c_rtc_data *data;
 
 	int irq_alarm;
-	int irq_tick;
-
-	spinlock_t pie_lock;
 	spinlock_t alarm_lock;
 
-	int ticnt_save;
-	int ticnt_en_save;
 	bool wake_en;
 };
 
 struct s3c_rtc_data {
-	int max_user_freq;
 	bool needs_src_clk;
 
 	void (*irq_handler) (struct s3c_rtc *info, int mask);
-	void (*set_freq) (struct s3c_rtc *info, int freq);
-	void (*enable_tick) (struct s3c_rtc *info, struct seq_file *seq);
-	void (*select_tick_clk) (struct s3c_rtc *info);
-	void (*save_tick_cnt) (struct s3c_rtc *info);
-	void (*restore_tick_cnt) (struct s3c_rtc *info);
 	void (*enable) (struct s3c_rtc *info);
 	void (*disable) (struct s3c_rtc *info);
 };
@@ -91,17 +80,7 @@ static void s3c_rtc_disable_clk(struct s3c_rtc *info)
 	clk_disable(info->rtc_clk);
 }
 
-/* IRQ Handlers */
-static irqreturn_t s3c_rtc_tickirq(int irq, void *id)
-{
-	struct s3c_rtc *info = (struct s3c_rtc *)id;
-
-	if (info->data->irq_handler)
-		info->data->irq_handler(info, S3C2410_INTP_TIC);
-
-	return IRQ_HANDLED;
-}
-
+/* IRQ Handler */
 static irqreturn_t s3c_rtc_alarmirq(int irq, void *id)
 {
 	struct s3c_rtc *info = (struct s3c_rtc *)id;
@@ -148,28 +127,6 @@ static int s3c_rtc_setaie(struct device *dev, unsigned int enabled)
 	return ret;
 }
 
-/* Set RTC frequency */
-static int s3c_rtc_setfreq(struct s3c_rtc *info, int freq)
-{
-	int ret;
-
-	if (!is_power_of_2(freq))
-		return -EINVAL;
-
-	ret = s3c_rtc_enable_clk(info);
-	if (ret)
-		return ret;
-	spin_lock_irq(&info->pie_lock);
-
-	if (info->data->set_freq)
-		info->data->set_freq(info, freq);
-
-	spin_unlock_irq(&info->pie_lock);
-	s3c_rtc_disable_clk(info);
-
-	return 0;
-}
-
 /* Time read/write */
 static int s3c_rtc_gettime(struct device *dev, struct rtc_time *rtc_tm)
 {
@@ -348,29 +305,11 @@ static int s3c_rtc_setalarm(struct device *dev, struct rtc_wkalrm *alrm)
 	return 0;
 }
 
-static int s3c_rtc_proc(struct device *dev, struct seq_file *seq)
-{
-	struct s3c_rtc *info = dev_get_drvdata(dev);
-	int ret;
-
-	ret = s3c_rtc_enable_clk(info);
-	if (ret)
-		return ret;
-
-	if (info->data->enable_tick)
-		info->data->enable_tick(info, seq);
-
-	s3c_rtc_disable_clk(info);
-
-	return 0;
-}
-
 static const struct rtc_class_ops s3c_rtcops = {
 	.read_time	= s3c_rtc_gettime,
 	.set_time	= s3c_rtc_settime,
 	.read_alarm	= s3c_rtc_getalarm,
 	.set_alarm	= s3c_rtc_setalarm,
-	.proc		= s3c_rtc_proc,
 	.alarm_irq_enable = s3c_rtc_setaie,
 };
 
@@ -450,18 +389,12 @@ static int s3c_rtc_probe(struct platform_device *pdev)
 	if (!info)
 		return -ENOMEM;
 
-	/* find the IRQs */
-	info->irq_tick = platform_get_irq(pdev, 1);
-	if (info->irq_tick < 0)
-		return info->irq_tick;
-
 	info->dev = &pdev->dev;
 	info->data = of_device_get_match_data(&pdev->dev);
 	if (!info->data) {
 		dev_err(&pdev->dev, "failed getting s3c_rtc_data\n");
 		return -EINVAL;
 	}
-	spin_lock_init(&info->pie_lock);
 	spin_lock_init(&info->alarm_lock);
 
 	platform_set_drvdata(pdev, info);
@@ -470,8 +403,7 @@ static int s3c_rtc_probe(struct platform_device *pdev)
 	if (info->irq_alarm < 0)
 		return info->irq_alarm;
 
-	dev_dbg(&pdev->dev, "s3c2410_rtc: tick irq %d, alarm irq %d\n",
-		info->irq_tick, info->irq_alarm);
+	dev_dbg(&pdev->dev, "s3c2410_rtc: alarm irq %d\n", info->irq_alarm);
 
 	/* get the memory region */
 	info->base = devm_platform_ioremap_resource(pdev, 0);
@@ -546,18 +478,6 @@ static int s3c_rtc_probe(struct platform_device *pdev)
 		goto err_nortc;
 	}
 
-	ret = devm_request_irq(&pdev->dev, info->irq_tick, s3c_rtc_tickirq,
-			       0, "s3c2410-rtc tick", info);
-	if (ret) {
-		dev_err(&pdev->dev, "IRQ%d error %d\n", info->irq_tick, ret);
-		goto err_nortc;
-	}
-
-	if (info->data->select_tick_clk)
-		info->data->select_tick_clk(info);
-
-	s3c_rtc_setfreq(info, 1);
-
 	s3c_rtc_disable_clk(info);
 
 	return 0;
@@ -585,10 +505,6 @@ static int s3c_rtc_suspend(struct device *dev)
 	if (ret)
 		return ret;
 
-	/* save TICNT for anyone using periodic interrupts */
-	if (info->data->save_tick_cnt)
-		info->data->save_tick_cnt(info);
-
 	if (info->data->disable)
 		info->data->disable(info);
 
@@ -609,9 +525,6 @@ static int s3c_rtc_resume(struct device *dev)
 	if (info->data->enable)
 		info->data->enable(info);
 
-	if (info->data->restore_tick_cnt)
-		info->data->restore_tick_cnt(info);
-
 	s3c_rtc_disable_clk(info);
 
 	if (device_may_wakeup(dev) && info->wake_en) {
@@ -635,162 +548,27 @@ static void s3c6410_rtc_irq(struct s3c_rtc *info, int mask)
 	writeb(mask, info->base + S3C2410_INTP);
 }
 
-static void s3c2410_rtc_setfreq(struct s3c_rtc *info, int freq)
-{
-	unsigned int tmp = 0;
-	int val;
-
-	tmp = readb(info->base + S3C2410_TICNT);
-	tmp &= S3C2410_TICNT_ENABLE;
-
-	val = (info->rtc->max_user_freq / freq) - 1;
-	tmp |= val;
-
-	writel(tmp, info->base + S3C2410_TICNT);
-}
-
-static void s3c2416_rtc_setfreq(struct s3c_rtc *info, int freq)
-{
-	unsigned int tmp = 0;
-	int val;
-
-	tmp = readb(info->base + S3C2410_TICNT);
-	tmp &= S3C2410_TICNT_ENABLE;
-
-	val = (info->rtc->max_user_freq / freq) - 1;
-
-	tmp |= S3C2443_TICNT_PART(val);
-	writel(S3C2443_TICNT1_PART(val), info->base + S3C2443_TICNT1);
-
-	writel(S3C2416_TICNT2_PART(val), info->base + S3C2416_TICNT2);
-
-	writel(tmp, info->base + S3C2410_TICNT);
-}
-
-static void s3c2443_rtc_setfreq(struct s3c_rtc *info, int freq)
-{
-	unsigned int tmp = 0;
-	int val;
-
-	tmp = readb(info->base + S3C2410_TICNT);
-	tmp &= S3C2410_TICNT_ENABLE;
-
-	val = (info->rtc->max_user_freq / freq) - 1;
-
-	tmp |= S3C2443_TICNT_PART(val);
-	writel(S3C2443_TICNT1_PART(val), info->base + S3C2443_TICNT1);
-
-	writel(tmp, info->base + S3C2410_TICNT);
-}
-
-static void s3c6410_rtc_setfreq(struct s3c_rtc *info, int freq)
-{
-	int val;
-
-	val = (info->rtc->max_user_freq / freq) - 1;
-	writel(val, info->base + S3C2410_TICNT);
-}
-
-static void s3c24xx_rtc_enable_tick(struct s3c_rtc *info, struct seq_file *seq)
-{
-	unsigned int ticnt;
-
-	ticnt = readb(info->base + S3C2410_TICNT);
-	ticnt &= S3C2410_TICNT_ENABLE;
-
-	seq_printf(seq, "periodic_IRQ\t: %s\n", ticnt  ? "yes" : "no");
-}
-
-static void s3c2416_rtc_select_tick_clk(struct s3c_rtc *info)
-{
-	unsigned int con;
-
-	con = readw(info->base + S3C2410_RTCCON);
-	con |= S3C2443_RTCCON_TICSEL;
-	writew(con, info->base + S3C2410_RTCCON);
-}
-
-static void s3c6410_rtc_enable_tick(struct s3c_rtc *info, struct seq_file *seq)
-{
-	unsigned int ticnt;
-
-	ticnt = readw(info->base + S3C2410_RTCCON);
-	ticnt &= S3C64XX_RTCCON_TICEN;
-
-	seq_printf(seq, "periodic_IRQ\t: %s\n", ticnt  ? "yes" : "no");
-}
-
-static void s3c24xx_rtc_save_tick_cnt(struct s3c_rtc *info)
-{
-	info->ticnt_save = readb(info->base + S3C2410_TICNT);
-}
-
-static void s3c24xx_rtc_restore_tick_cnt(struct s3c_rtc *info)
-{
-	writeb(info->ticnt_save, info->base + S3C2410_TICNT);
-}
-
-static void s3c6410_rtc_save_tick_cnt(struct s3c_rtc *info)
-{
-	info->ticnt_en_save = readw(info->base + S3C2410_RTCCON);
-	info->ticnt_en_save &= S3C64XX_RTCCON_TICEN;
-	info->ticnt_save = readl(info->base + S3C2410_TICNT);
-}
-
-static void s3c6410_rtc_restore_tick_cnt(struct s3c_rtc *info)
-{
-	unsigned int con;
-
-	writel(info->ticnt_save, info->base + S3C2410_TICNT);
-	if (info->ticnt_en_save) {
-		con = readw(info->base + S3C2410_RTCCON);
-		writew(con | info->ticnt_en_save, info->base + S3C2410_RTCCON);
-	}
-}
-
 static struct s3c_rtc_data const s3c2410_rtc_data = {
-	.max_user_freq		= 128,
 	.irq_handler		= s3c24xx_rtc_irq,
-	.set_freq		= s3c2410_rtc_setfreq,
-	.enable_tick		= s3c24xx_rtc_enable_tick,
-	.save_tick_cnt		= s3c24xx_rtc_save_tick_cnt,
-	.restore_tick_cnt	= s3c24xx_rtc_restore_tick_cnt,
 	.enable			= s3c24xx_rtc_enable,
 	.disable		= s3c24xx_rtc_disable,
 };
 
 static struct s3c_rtc_data const s3c2416_rtc_data = {
-	.max_user_freq		= 32768,
 	.irq_handler		= s3c24xx_rtc_irq,
-	.set_freq		= s3c2416_rtc_setfreq,
-	.enable_tick		= s3c24xx_rtc_enable_tick,
-	.select_tick_clk	= s3c2416_rtc_select_tick_clk,
-	.save_tick_cnt		= s3c24xx_rtc_save_tick_cnt,
-	.restore_tick_cnt	= s3c24xx_rtc_restore_tick_cnt,
 	.enable			= s3c24xx_rtc_enable,
 	.disable		= s3c24xx_rtc_disable,
 };
 
 static struct s3c_rtc_data const s3c2443_rtc_data = {
-	.max_user_freq		= 32768,
 	.irq_handler		= s3c24xx_rtc_irq,
-	.set_freq		= s3c2443_rtc_setfreq,
-	.enable_tick		= s3c24xx_rtc_enable_tick,
-	.select_tick_clk	= s3c2416_rtc_select_tick_clk,
-	.save_tick_cnt		= s3c24xx_rtc_save_tick_cnt,
-	.restore_tick_cnt	= s3c24xx_rtc_restore_tick_cnt,
 	.enable			= s3c24xx_rtc_enable,
 	.disable		= s3c24xx_rtc_disable,
 };
 
 static struct s3c_rtc_data const s3c6410_rtc_data = {
-	.max_user_freq		= 32768,
 	.needs_src_clk		= true,
 	.irq_handler		= s3c6410_rtc_irq,
-	.set_freq		= s3c6410_rtc_setfreq,
-	.enable_tick		= s3c6410_rtc_enable_tick,
-	.save_tick_cnt		= s3c6410_rtc_save_tick_cnt,
-	.restore_tick_cnt	= s3c6410_rtc_restore_tick_cnt,
 	.enable			= s3c24xx_rtc_enable,
 	.disable		= s3c6410_rtc_disable,
 };
-- 
2.17.1

