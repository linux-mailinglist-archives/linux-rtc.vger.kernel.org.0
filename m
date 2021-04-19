Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 086F1363928
	for <lists+linux-rtc@lfdr.de>; Mon, 19 Apr 2021 03:45:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232958AbhDSBqY (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 18 Apr 2021 21:46:24 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:50115 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232013AbhDSBqX (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 18 Apr 2021 21:46:23 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 183381FC1;
        Sun, 18 Apr 2021 21:45:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Sun, 18 Apr 2021 21:45:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm2; bh=44Z8MZBw8oX4GuSEIzaWdEz1Gd
        RB6L8qCHH2tRotiss=; b=l37Xf5O7wSoCNna0+jXpSVdSjSsApRLpUDWP85azvr
        f0D6MUUku18wBB2X681KydbNyre1ZWA+L5hSHw65FrP0hq4d0TT/Chr7qF9CjXYE
        AMT3KuCTCerCl9ELKMPWqJ9LMfSG9QaBAMg3dO/YmCm3rqo88mUFb2+ZruT5j47j
        t8ra4Im7cFMDEKNrntP99BLvmGapnwEfiS8spVRMuTJrVMeqcXsnec5tNFNut6Ah
        whAO4sIpJRoNcAyF6xmj2UweD0Bpb1ZRY3uA0lnmro5BUklyV8OrXhQi89WgVB5I
        ybbT5oNLKYSkko9e4h134r6iL+1D6EgExY3n5eut3naw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=44Z8MZBw8oX4GuSEI
        zaWdEz1GdRB6L8qCHH2tRotiss=; b=JVC+uIlJ9ADTCsozCJCAJTyuUivKUnSb+
        MvSpZJm6oP//XZ8ScNSiic5Jm45/DvWvnDvC1ShVG2X7a5GjhP8Dj7JIVXSEfTdf
        lDypsF2npJfuOQYC/mDqA5hpoij+nSIVq0zq/YBfKX2owzbkzSWCVZqX18xY+rq/
        FWaIqdd/dVr/VQDLU3YptF+LBkMDtJOFpprIpkcIn6gwsVUz1s0L2NtypHl++ZEY
        EUzgs0p1tr9/Eg8PZrYgG3m414d+is5a+kCUYfvE92XysufNmjcXdrN1Ojz9WvYn
        iNkwWtbPDj79aiQ7fCnkCEOzmZmXpGOA0KJAA4FWDhmeCQEP+4K5Q==
X-ME-Sender: <xms:z-B8YMUV7VISxZFLRY0xYrrvtgb42-9cv8deFATGRAO50EhZjAN1XQ>
    <xme:z-B8YAlfE4CJYhrTuaLGyD0T-EghI_3-saZ3w7Q87F8ozCwNHbwQ-02GT9U65FHc-
    8UAjljX8WXX3NlB0w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddtvddgkeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgvlhcu
    jfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtffrrg
    htthgvrhhnpeeiteekhfehuddugfeltddufeejjeefgeevheekueffhffhjeekheeiffdt
    vedtveenucfkphepjedtrddufeehrddugeekrdduhedunecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghnugdr
    ohhrgh
X-ME-Proxy: <xmx:z-B8YAblTVFrcRlwHkUmH_K4JW_stNwC8MaW5wqNkX1WhZ81JrCUaA>
    <xmx:z-B8YLVTWTRqPIDQboaTR5PyEGfsH-qCcNGG5rT-iYyOJAElcxFzrA>
    <xmx:z-B8YGkGXeg2CeD547OhKjqOhF6aBwiPczyhXGgkDz3jHrYCZOlvZw>
    <xmx:0eB8YIW9Jg71gq2Ood13y6Wsr1BMDWxnPe3OWnKor9Y29SxTmlmaWw>
Received: from titanium.stl.sholland.net (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA id 96F78240054;
        Sun, 18 Apr 2021 21:45:50 -0400 (EDT)
From:   Samuel Holland <samuel@sholland.org>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        Samuel Holland <samuel@sholland.org>
Subject: [PATCH] rtc: sun6i: Add NVMEM provider
Date:   Sun, 18 Apr 2021 20:45:49 -0500
Message-Id: <20210419014549.26900-1-samuel@sholland.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The sun6i RTC provides 32 bytes of general-purpose data registers.
They can be used to save data in the always-on RTC power domain.
The registers are writable via 32-bit MMIO accesses only.

Expose the region as a NVMEM provider so it can be used by userspace and
other drivers.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 drivers/rtc/rtc-sun6i.c | 42 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
index e75020ab8024..f4a5e7465148 100644
--- a/drivers/rtc/rtc-sun6i.c
+++ b/drivers/rtc/rtc-sun6i.c
@@ -69,6 +69,10 @@
 #define SUN6I_LOSC_OUT_GATING			0x0060
 #define SUN6I_LOSC_OUT_GATING_EN_OFFSET		0
 
+/* General-purpose data */
+#define SUN6I_GP_DATA				0x0100
+#define SUN6I_GP_DATA_SIZE			0x20
+
 /*
  * Get date values
  */
@@ -641,6 +645,39 @@ static const struct rtc_class_ops sun6i_rtc_ops = {
 	.alarm_irq_enable	= sun6i_rtc_alarm_irq_enable
 };
 
+static int sun6i_rtc_nvmem_read(void *priv, unsigned int offset, void *_val, size_t bytes)
+{
+	struct sun6i_rtc_dev *chip = priv;
+	u32 *val = _val;
+	int i;
+
+	for (i = 0; i < bytes / 4; ++i)
+		val[i] = readl(chip->base + SUN6I_GP_DATA + offset + 4 * i);
+
+	return 0;
+}
+
+static int sun6i_rtc_nvmem_write(void *priv, unsigned int offset, void *_val, size_t bytes)
+{
+	struct sun6i_rtc_dev *chip = priv;
+	u32 *val = _val;
+	int i;
+
+	for (i = 0; i < bytes / 4; ++i)
+		writel(val[i], chip->base + SUN6I_GP_DATA + offset + 4 * i);
+
+	return 0;
+}
+
+static struct nvmem_config sun6i_rtc_nvmem_cfg = {
+	.type		= NVMEM_TYPE_BATTERY_BACKED,
+	.reg_read	= sun6i_rtc_nvmem_read,
+	.reg_write	= sun6i_rtc_nvmem_write,
+	.size		= SUN6I_GP_DATA_SIZE,
+	.word_size	= 4,
+	.stride		= 4,
+};
+
 /* Enable IRQ wake on suspend, to wake up from RTC. */
 static int sun6i_rtc_suspend(struct device *dev)
 {
@@ -728,6 +765,11 @@ static int sun6i_rtc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	sun6i_rtc_nvmem_cfg.priv = chip;
+	ret = devm_rtc_nvmem_register(chip->rtc, &sun6i_rtc_nvmem_cfg);
+	if (ret)
+		return ret;
+
 	dev_info(&pdev->dev, "RTC enabled\n");
 
 	return 0;
-- 
2.26.3

