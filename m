Return-Path: <linux-rtc+bounces-1567-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A85C5939232
	for <lists+linux-rtc@lfdr.de>; Mon, 22 Jul 2024 18:02:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 622F8282531
	for <lists+linux-rtc@lfdr.de>; Mon, 22 Jul 2024 16:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0A5616EB62;
	Mon, 22 Jul 2024 16:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="nKd4dsDy"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF591598F4;
	Mon, 22 Jul 2024 16:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721664134; cv=none; b=R0wchmz0oFFkJgpvRn1GLBJZId/7kvbTEJGNfgigPH3ke9qnTiiiMnPcHw+Coe3vqXDkUE0pEJCAF7Hr6p29DhttrdGSXRizrMxRa5s0ZxqnkH6PeDH/qrNLnhBkXWnfoOsnkjrmtT6q6jYzNcWZVkgRZuYDPIxpM2DicXE4j5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721664134; c=relaxed/simple;
	bh=0aUFV+1C577FXdQlgrAqN5Fiv6hI6pb16iH53Otdby8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IZlPywH8Y414iazIiPSkkHaUokyDK6ceMKvP0cKPZOTuW6Y0nNPCx+UdhK28JQxD8eoum1P+k5OtSy2R3eI3c/vKtsyTLzqTpsvg+NHR505X9Yd9qAoudwiLyoodDrU3zcN5GiWm99drCoZJuxfakVR5MoMSVLzmiaraVjY7/bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=nKd4dsDy; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46MB0jav014214;
	Mon, 22 Jul 2024 18:01:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=+JVnZ5RexfRvHDFJf6ZIGo
	vlJ2rC2GSlwR/nIH1b+/c=; b=nKd4dsDyLHAKcqL/uR5HihqAgcBFZD/jUOMMIo
	Cmea+nInlLxEAYMRwu6Mx0dHpDJZJO3jsoYsAYwJU9GPh0mSAPaSa5IW3h9pJq49
	XN+ltpJepaRPzFkrNhwRkpXb1/wSIARv8798BARmNTaTC3P60+v8rkypagknG3WX
	xAXr/1A+mkhzCpNcGs9ntUm4FEAgB2K9gKHBtJn0WC/bWsITlL+euPLR+NXyD3th
	rjtwPB3AjbszLJTWLCa4p3N0O91s7prVY838Fkfxk/csHty5BIwo6aP+WXpzqzSt
	AEIW44seGgYy7hT0TJUV4nhtzI68BXS4x2i6wivdMJxdDKxg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 40g2ngxpxb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jul 2024 18:01:41 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9A8C340044;
	Mon, 22 Jul 2024 18:01:35 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 79D442786EA;
	Mon, 22 Jul 2024 18:00:58 +0200 (CEST)
Received: from localhost (10.48.86.111) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 22 Jul
 2024 18:00:58 +0200
From: Valentin Caron <valentin.caron@foss.st.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Amelie Delaunay <amelie.delaunay@foss.st.com>,
        Valentin Caron
	<valentin.caron@foss.st.com>
Subject: [PATCH v3 0/4] rtc: stm32: add pinctrl interface to handle RTC outs
Date: Mon, 22 Jul 2024 18:00:18 +0200
Message-ID: <20240722160022.454226-1-valentin.caron@foss.st.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-22_10,2024-07-22_01,2024-05-17_01

This series adds a pinctrl/pinmux interface to control STM32 RTC outputs.

Theses two signals output are possible:
 - LSCO (Low Speed Clock Output) that allow to output LSE clock on a pin.
   On STM32MPU Discovery boards, this feature is used to generate a clock
   to Wifi/Bluetooth module.
 - Alarm out that allow to send a pulse on a pin when alarm A of the RTC
   expires.

First attempt [1] was based on 'st,' vendor properties, this one is based
on pinctrl and pinmux framework.

As device-trees will be upstreamed separately, here is an example:

stm32-pinctrl {
    rtc_rsvd_pins_a: rtc-rsvd-0 {
        pins {
            pinmux = <STM32_PINMUX('B', 2, AF1)>, /* OUT2 */
                     <STM32_PINMUX('I', 8, ANALOG)>; /* OUT2_RMP */
        };
    };
};

stm32-rtc {
    pinctrl-0 = <&rtc_rsvd_pins_a &rtc_alarma_pins_a>;

    /* Enable by foo-device */
    rtc_lsco_pins_a: rtc-lsco-0 {
        pins = "out2_rmp";
        function = "lsco";
    };

    /* Enable by stm32-rtc hog */
    rtc_alarma_pins_a: rtc-alarma-0 {
        pins = "out2";
        function = "alarm-a";
    };
};

foo-device {
    pinctrl-0 = <&rtc_lsco_pins_a>;
};

[1] https://lore.kernel.org/linux-arm-kernel/20220504130617.331290-5-valentin.caron@foss.st.com/t/#m37935e92315e22bbe085775096175afc05b7ff09

Since v2:
 - Modify Kconfig after (a lot of) robots alert:
     + https://lore.kernel.org/oe-kbuild-all/202407190654.I3RI7WfP-lkp@intel.com/
     + https://lore.kernel.org/oe-kbuild-all/202407191258.1oitwwMV-lkp@intel.com/
     + https://lore.kernel.org/oe-kbuild-all/202407200400.NnW2fJ0q-lkp@intel.com/
     + https://lore.kernel.org/oe-kbuild-all/202407181525.BRNKqmNf-lkp@intel.com/
     + https://lore.kernel.org/oe-kbuild-all/202407191830.8bh5dJ09-lkp@intel.com/
   Make RTC_DRV_STM32 depends on OF, PINCTRL and COMMON_CLK as they are menuconfig entry.
   Make RTC_DRV_STM32 select PINCONF, PINCONF_GENERIC and PINMUX as they config entry.
   
Since v1:
 - Select PINMUX and PINCONF_GENERIC to solve:
   https://lore.kernel.org/oe-kbuild-all/202407130943.ie6n2Orh-lkp@intel.com/
 - Make stm32_rtc_pinctrl_pins as static to solve:
   https://lore.kernel.org/oe-kbuild-all/202407130612.OEicZbNE-lkp@intel.com/
 - Change "depends on" to "select" COMMON_CLK config
 - Modify regex in dt-binding to avoid properties like "rtc--123" as valid ones.

Valentin Caron (4):
  dt-bindings: rtc: stm32: describe pinmux nodes
  rtc: stm32: add pinctrl and pinmux interfaces
  rtc: stm32: add Low Speed Clock Output (LSCO) support
  rtc: stm32: add alarm A out feature

 .../devicetree/bindings/rtc/st,stm32-rtc.yaml |  28 ++
 drivers/rtc/Kconfig                           |   6 +
 drivers/rtc/rtc-stm32.c                       | 281 ++++++++++++++++++
 3 files changed, 315 insertions(+)

-- 
2.25.1


