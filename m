Return-Path: <linux-rtc+bounces-1480-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4207692EA58
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Jul 2024 16:10:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E68C1C2318E
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Jul 2024 14:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DBFB16132B;
	Thu, 11 Jul 2024 14:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="OiEOt13m"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F9914BFA2;
	Thu, 11 Jul 2024 14:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720707018; cv=none; b=LZ0luG3h4+KKBLOi7yqKFFpJEWBZm1XaYzhDfNS1HipGtN/c6wd9pFfzCPVRP4Fbty7ujaI7T7ZtIM/Y/Xb6tDNDH/x126Vx6QMhD/R2YJ0ytuZDDxiFpn9ndv70OE/WsnRFvz1njgLYqs7sSaqe4kB0V93An7yszRXlJ5Uk/lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720707018; c=relaxed/simple;
	bh=GBZyInE3PesrUM4Nwjvihn4i0NhL2MlXaDUQG7t0qWY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sgx4CB5MIVmQGNaEEDD+cPEk2bCixH+D6KeqU00xTixB2Xbsgb0fsLZRek2xDG5aC/APgMGHlO0kc6jXn6OkB7fU8XMOPTHx1nXyQx/TV9zsMXg/QFSCxvRifR9kKKbwIhMsQTqqPRk40LCQM6ywOAAUp6s1wHM78VBsZM7FiJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=OiEOt13m; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46BAhAq7001787;
	Thu, 11 Jul 2024 16:09:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=810oLGHtnWvk0qunlO6ujw
	f2zHVTB1qeFo9iOn5quoI=; b=OiEOt13mEH9VqWkPNwsAmV1GAAe7f0idnPMNB+
	o5nL7P7GYrgWDAtfrr1GyxNAGYjLLVoqBjIBfVW7IrHrohG5sIyBDOn7Wj9RQuLv
	BiKbmxDRSBGnwb/pjS58cSBkWDTzG3aca37pVpCWC6HLf0CHLSNgwc1yP5x242m9
	gVGvHKnBh0an5mMnqKRxmeyjpW+vacxcnusualFiLkTz+zGYXBo8HbNWXtuMotB8
	0Qy6WZKkf2w/AQKd5JH5goTjHBEfEpda5gOiw3hUoyXVwARb3EJ0UateJ2bugesY
	xjfDRR1XRpUs/H6V6wv3UvfP/iaCeJLwd52lNTWOmc11CjGA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 406wj36cvg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jul 2024 16:09:41 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 970C94002D;
	Thu, 11 Jul 2024 16:09:36 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F40A223D407;
	Thu, 11 Jul 2024 16:08:57 +0200 (CEST)
Received: from localhost (10.48.86.111) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 11 Jul
 2024 16:08:57 +0200
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
Subject: [PATCH 0/4] rtc: stm32: add pinctrl interface to handle RTC outs
Date: Thu, 11 Jul 2024 16:08:39 +0200
Message-ID: <20240711140843.3201530-1-valentin.caron@foss.st.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-11_10,2024-07-11_01,2024-05-17_01

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

Valentin Caron (4):
  dt-bindings: rtc: stm32: describe pinmux nodes
  rtc: stm32: add pinctrl and pinmux interfaces
  rtc: stm32: add Low Speed Clock Output (LSCO) support
  rtc: stm32: add alarm A out feature

 .../devicetree/bindings/rtc/st,stm32-rtc.yaml |  28 ++
 drivers/rtc/Kconfig                           |   1 +
 drivers/rtc/rtc-stm32.c                       | 281 ++++++++++++++++++
 3 files changed, 310 insertions(+)

-- 
2.25.1


