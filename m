Return-Path: <linux-rtc+bounces-1458-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C7992A622
	for <lists+linux-rtc@lfdr.de>; Mon,  8 Jul 2024 17:52:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 494A81F2203D
	for <lists+linux-rtc@lfdr.de>; Mon,  8 Jul 2024 15:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CE4614389A;
	Mon,  8 Jul 2024 15:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="KKUduYnr"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06761EA6F;
	Mon,  8 Jul 2024 15:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720453928; cv=none; b=eXWmiub00IyrWkwPz9yP91Azpp6fik7+J5jW0rlHtvLthiDz5H44RFgL2sgYovwcPkxR/Otc9J4z+2lWwXZqwFpS17APWbGFKx4Dpn04kJ7KfAbMgDKK19exNKZ9kj3F8Zgc4V2IrXo8LTRlAt3SGTKj35j3OZiVaejBXOOVf3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720453928; c=relaxed/simple;
	bh=uX7pjvdiX5hRQZ+rpDun17XQqphODMw7y9hY3JKb7hA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=W7gEeo3rPZ/Cnulc157SZ1u8RBvek33Dnc3zzWPUu1gbE2MCs/1ty5GREDfrxLJ+c6Ouz8HV3PLLI/3v9JNAHRgkXAblV6FuFNw6SRmeoUTYoilVdx7J+tvcVxEpI2v7iQ6AUgRZ7F9zKsRDEg0Wf1PWNPPIoSu5hRv5wOIM2lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=KKUduYnr; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 468CQotj008257;
	Mon, 8 Jul 2024 17:35:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=4Q3Tj4ealwssXZ+WV7UTml
	cU/6UNVKfTT/zvcxWH+xM=; b=KKUduYnrLS4fNWgApk66VkJTO/MH3Xfno6r3ip
	el0B3pYAryJ9zNyQ/VuKF5G+liGwxBwAHZaaKXMkEnpwscDqE7yH8VilaSJwhOPu
	y9xYkcvEC/XMaHPQMVKdLU2OKtzFsZgPLlLqv3erpOu3aNCKPQ1tIU0v4e0Fviwa
	EoEOvr0kmo2Cf/41TndMrfROA1Yn0O9ZJJ1wSDBbdcykBneQm28h+4NAoylt6KLp
	s+9G/ijD3XqxSxCu8biGJiEOg0kwbIpc/8NAtiA/3aCGbyRr+7g4b2/SvseEuFRt
	jy7g/aB9aaT1+ukv5RcmuuO2f+30JXhpjI65ElrlhTYd7g4A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 406whhftpj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jul 2024 17:35:50 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2FF2D40048;
	Mon,  8 Jul 2024 17:35:44 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7F4F522D0F6;
	Mon,  8 Jul 2024 17:35:06 +0200 (CEST)
Received: from localhost (10.48.86.111) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 8 Jul
 2024 17:35:06 +0200
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
Subject: [PATCH v2 0/2] rtc: stm32: introduce new st,stm32mp25-rtc compatible
Date: Mon, 8 Jul 2024 17:34:32 +0200
Message-ID: <20240708153434.416287-1-valentin.caron@foss.st.com>
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
 definitions=2024-07-08_09,2024-07-05_01,2024-05-17_01

Introduce new st,stm32mp25-rtc compatible. It is based on st,stm32mp1-rtc.

Difference is that stm32mp25 SoC implements a triple protection on RTC
registers:
- Secure bit based protection
- Privileged context based protection
- Compartment ID filtering based protection
This driver will now check theses configurations before probing to avoid
exceptions and fake reads on register.

Link: https://www.st.com/resource/en/reference_manual/rm0457-stm32mp25xx-advanced-armbased-3264bit-mpus-stmicroelectronics.pdf#page=4081

Since v1:
 - Replace "anyOf: const:" by "enum:"

Valentin Caron (2):
  dt-bindings: rtc: stm32: introduce new st,stm32mp25-rtc compatible
  rtc: stm32: add new st,stm32mp25-rtc compatible and check RIF
    configuration

 .../devicetree/bindings/rtc/st,stm32-rtc.yaml |  5 +-
 drivers/rtc/rtc-stm32.c                       | 78 +++++++++++++++++++
 2 files changed, 82 insertions(+), 1 deletion(-)

-- 
2.25.1


