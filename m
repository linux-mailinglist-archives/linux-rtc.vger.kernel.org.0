Return-Path: <linux-rtc+bounces-1276-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C48C90410D
	for <lists+linux-rtc@lfdr.de>; Tue, 11 Jun 2024 18:21:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CDFA51F24AE3
	for <lists+linux-rtc@lfdr.de>; Tue, 11 Jun 2024 16:21:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D70433BB48;
	Tue, 11 Jun 2024 16:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="e28medZ8"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251783B2A2;
	Tue, 11 Jun 2024 16:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718122880; cv=none; b=XNMrR0Qh024m7nI34EFec9PiSlvcftFj0WYMcMWK9W21zyLvEl+RDSOE38iTiIPTba4cDlBABIh8xS68E405EvSByyWkgIza8oikIxmdmjYcGN3+VbiQf+5dzlzSeT52lzA1iQQ3GCIyuFMmcx54neSHZpQDmDvuZxAsW9XzPHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718122880; c=relaxed/simple;
	bh=vB1Z8owwQFnccUD4CBUpS3sE/qzWmtYubLamM2KiaQ8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pVZ5JKuvOF414TmmFGkmysI9VRE4Iy3Teq5lm0rSkp0Et+92cXN7iG8lUKyGRc7nbZeNSNc89yfCSnyoCRJFimO3txd+E8oWNji2mWzRQRotjEk6q0QRZg/6UuUdyt73obMxesumJMYaLpqfFteAz4+YpLc01B/uheLCGwwqmzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=e28medZ8; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45BC0Q6m016205;
	Tue, 11 Jun 2024 18:20:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=yyuPGJTfdCHwwLsvwEMk87
	kB7VvmjgA9WbN3NWRLHL4=; b=e28medZ86wJBqEN9AjMftTIgb0FGGRqFkp7FKN
	ap64/W+Iz1LtR1p4hKeZcYdsZNjWh8A3VcPJ37BnSLvEYQQuVFUWPOvUAd8flQek
	IDZP6Tos+Zmpp4yO+wAxyvgSkEaypvW1xePzxscQaWqU5cgXNdZUh0UU/DL2qSZs
	wO26bJ+ngO9Z/jlyN9RmV4roITWcvrsWO3MGvWT9tRLzJuOUw5CbmI275qlKgb8D
	MiHV97TaXHrElR8uUIWSI4QGSaRygDSxVNrgqfDG/t64Qmjqge+ZuP89zuGN/Caq
	vpaFUBlM0jd+jhhlo1cAfbIH6zkUJH7668uisSv24NFC3uXw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ypbp4kusv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 18:20:55 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7C75F4002D;
	Tue, 11 Jun 2024 18:20:48 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8CEFA21B503;
	Tue, 11 Jun 2024 18:20:11 +0200 (CEST)
Received: from localhost (10.48.86.111) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 11 Jun
 2024 18:20:11 +0200
From: Valentin Caron <valentin.caron@foss.st.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Valentin Caron <valentin.caron@foss.st.com>
Subject: [PATCH 0/2] rtc: stm32: introduce new st,stm32mp25-rtc compatible
Date: Tue, 11 Jun 2024 18:19:56 +0200
Message-ID: <20240611161958.469209-1-valentin.caron@foss.st.com>
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
 definitions=2024-06-11_09,2024-06-11_01,2024-05-17_01

Introduce new st,stm32mp25-rtc compatible. It is based on st,stm32mp1-rtc.

Difference is that stm32mp25 SoC implements a triple protection on RTC
registers:
- Secure bit based protection
- Privileged context based protection
- Compartment ID filtering based protection
This driver will now check theses configurations before probing to avoid
exceptions and fake reads on register.

Link: https://www.st.com/resource/en/reference_manual/rm0457-stm32mp25xx-advanced-armbased-3264bit-mpus-stmicroelectronics.pdf#page=4081

Valentin Caron (2):
  dt-bindings: rtc: stm32: introduce new st,stm32mp25-rtc compatible
  rtc: stm32: add new st,stm32mp25-rtc compatible and check RIF
    configuration

 .../devicetree/bindings/rtc/st,stm32-rtc.yaml |  5 +-
 drivers/rtc/rtc-stm32.c                       | 78 +++++++++++++++++++
 2 files changed, 82 insertions(+), 1 deletion(-)

-- 
2.25.1


