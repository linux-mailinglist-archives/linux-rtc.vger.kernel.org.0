Return-Path: <linux-rtc+bounces-1501-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5A7931395
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jul 2024 14:06:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BADA51F22EDE
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jul 2024 12:06:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB4FE18A93F;
	Mon, 15 Jul 2024 12:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Lhy4SEBL"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3968189F5E;
	Mon, 15 Jul 2024 12:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721045158; cv=none; b=WI1+TGp0gsXFOt5qg411M9tS3hr19dIcW3bdHViXiQK+j24OFINYegMKbuovIGx0hlGT4npxabwoz3vj8KMcZviKDgMXU4Mnw3v9kzcftzAi/1RXvZNPlja8qAIvrvvtwiF4nPEdW961EWpRKSTqaUJiOhd0rbGudyrN27wXFts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721045158; c=relaxed/simple;
	bh=ajfiIwgDbyeUkjhHbM8uaKnyLPFSikOKpQ9Fr/QLc9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GKI3JstuStlmvsb/WbDvoQsjJn886Zx2YhvpJ/PySX825t6HMI16mU1FfgYTwhNwBNFlJX4Jsxu3iOTQuzJRLwekYJnTxTY9+aMhmi3kSGmA7cjHdoEeXztchybnqR2RGOSlntxBoXAQB4O8PrFHZ1xT4OF52tjxIcwvd2EOs6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Lhy4SEBL; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46F7KiGN018841;
	Mon, 15 Jul 2024 14:05:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	NUrMaVQn6CtWJA/+Bg8Ut5g/xwCeF9VDjIao3Eq05ss=; b=Lhy4SEBL5/E6CsI+
	MrQvVgdMl+2xsKfsTLsby1FxY+LFEEb6piKHcdC994A/pHnyaB5QbL1S6LEwvfwQ
	wNNDFnI9cdd1/7FEouV0X9G3WeiW2U8OS7IuE4c2k7MDBSu2qaI4a2dzum2t4xHc
	aGGxXwlGsrwpGj12LjZ53oc5Ll5eZEVCJIm12qoz5QlfTnpv8oLJnvJf7lCs5J29
	Kw8Nheua67/UdIUdcFCFl0OV2DTuRgPiGbNiCgqvh/csfznZM1TXOIxENtaAUBv0
	f9PA2W+S2kyD1jyWccUIIo25Q75IuvyDfUG1F68Rk86ek1VNjgAQokg/CsESMdKx
	zF1d5A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 40bgfdef4v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Jul 2024 14:05:29 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id F349A40044;
	Mon, 15 Jul 2024 14:05:24 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8132E223F2F;
	Mon, 15 Jul 2024 14:04:46 +0200 (CEST)
Received: from [10.48.86.111] (10.48.86.111) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 15 Jul
 2024 14:04:45 +0200
Message-ID: <f6485370-b5cc-4774-aac0-6141fcca4c00@foss.st.com>
Date: Mon, 15 Jul 2024 14:04:38 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: rtc: stm32: describe pinmux nodes
To: Rob Herring <robh@kernel.org>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Amelie Delaunay <amelie.delaunay@foss.st.com>,
        Valentin Caron
	<valentin.caron@foss.st.com>
References: <20240711140843.3201530-1-valentin.caron@foss.st.com>
 <20240711140843.3201530-2-valentin.caron@foss.st.com>
 <20240711225646.GA3270567-robh@kernel.org>
Content-Language: en-US
From: Valentin CARON <valentin.caron@foss.st.com>
In-Reply-To: <20240711225646.GA3270567-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-15_06,2024-07-11_01,2024-05-17_01



On 7/12/24 00:56, Rob Herring wrote:
> On Thu, Jul 11, 2024 at 04:08:40PM +0200, Valentin Caron wrote:
>> STM32 RTC is capable to handle 3 specific pins of the soc (out1, out2,
>> out2_rmp) and to outputs 2 signals (LSCO, alarm-a).
>>
>> This feature is configured thanks to pinmux nodes and pinctrl framework.
>> This feature is available with compatible st,stm32mp1-rtc and
>> st,stm32mp25-rtc only.
>>
>> Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
>> ---
>>   .../devicetree/bindings/rtc/st,stm32-rtc.yaml | 28 +++++++++++++++++++
>>   1 file changed, 28 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml b/Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml
>> index 7a0fab721cf1..09221c2f8a0c 100644
>> --- a/Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml
>> +++ b/Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml
>> @@ -53,6 +53,28 @@ properties:
>>         override default rtc_ck parent clock phandle of the new parent clock of rtc_ck
>>       maxItems: 1
>>   
>> +patternProperties:
>> +  "^rtc-[a-z]*-[0-9]+$":
> 
> rtc--123 is valid? "*" should be "+"
> 
> Otherwise,
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Yes, it should be. I will add this in the next version.

Thanks,
Valentin

