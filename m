Return-Path: <linux-rtc+bounces-1538-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F7B933869
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jul 2024 09:59:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01BDB1F224C1
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jul 2024 07:59:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2C0D1CD2F;
	Wed, 17 Jul 2024 07:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="UFy3v8Uw"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209391CAB1;
	Wed, 17 Jul 2024 07:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721203136; cv=none; b=Uo6HnuCnF4WP2DNznVW56SY6dfkyds3XYn5TmIIbmjHUM8VcwAlKs3APeWrhRwarxoRodhC6r5R8OnTiSCK3Q4ATIEQbW7CLp7XFxfbh9ZflsiL8XDlBkw5Gl68Fz7l3i49qfJ0RL1jeLzTSP5CZMBCjupnCvgau2z82kU8yKEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721203136; c=relaxed/simple;
	bh=1AeF6NudXbXBPqkvKKUY8RKZBTzwY6oezxqVJum490Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZtGCe7iqv+MuNEDnwFa1i0JYYG9L64wapVjm4iX96GVbxilDuWMbowo+HP6bq6P9qeaiWmgtQVt1znRXFcIY1V0e7OqsSN4H3PHxINbsoExUawRYfAmHawsB+tOu9UwOMZn5I8DT5+ysjZw+JCIwewVDCs9JxkBJo1SjIx1kUOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=UFy3v8Uw; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46H5Dqlr012713;
	Wed, 17 Jul 2024 09:58:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	JysyCBZhVVX0Cqer7ON/N8yUNt3og7/Pelyhdd9TMOo=; b=UFy3v8UwHllZJT2N
	LHkfc8DIJiNRpmcdWwTr9rsI+cLhBs0w4JJ1ApFwQvR51+AJ7u4jSmzoKk9Ok0oR
	h+RhkwzdI4wYJ9muiOl17TBPC5Dk3LuNv6Hk/zl+XFBv6qgXnNZxHrgnKV6UWRH0
	BK/Awz4771/8y/CMaUcA4++jh8EH/WSKPExY5mAQzWtj636NYQ/HmrnGUAoyMaDN
	h5iiphfcOoMalmJkBHE3O+W4fP06+d5XZvy/0vApW8f72mbdzrN8ef2Qv7alJjBW
	pVsYfzD4CYk0BgG4mU67LP9dzV7q4jaffCpoF+6jzN1ehag6WssQ4XaWOvhJIxmK
	Ua2wJg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 40dwfdj9dw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jul 2024 09:58:39 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6419D40044;
	Wed, 17 Jul 2024 09:58:35 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A587E244DA1;
	Wed, 17 Jul 2024 09:57:58 +0200 (CEST)
Received: from [10.48.86.111] (10.48.86.111) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 17 Jul
 2024 09:57:58 +0200
Message-ID: <5266d334-0006-4fa8-981d-eca04f99a899@foss.st.com>
Date: Wed, 17 Jul 2024 09:57:55 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] rtc: stm32: add pinctrl interface to handle RTC outs
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
 <2024071521121650db391a@mail.local>
Content-Language: en-US
From: Valentin CARON <valentin.caron@foss.st.com>
In-Reply-To: <2024071521121650db391a@mail.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-17_04,2024-07-16_02,2024-05-17_01



On 7/15/24 23:12, Alexandre Belloni wrote:
> Hello,
> 
> On 11/07/2024 16:08:39+0200, Valentin Caron wrote:
>> This series adds a pinctrl/pinmux interface to control STM32 RTC outputs.
>>
>> Theses two signals output are possible:
>>   - LSCO (Low Speed Clock Output) that allow to output LSE clock on a pin.
>>     On STM32MPU Discovery boards, this feature is used to generate a clock
>>     to Wifi/Bluetooth module.
>>   - Alarm out that allow to send a pulse on a pin when alarm A of the RTC
>>     expires.
>>
>> First attempt [1] was based on 'st,' vendor properties, this one is based
>> on pinctrl and pinmux framework.
>>
>> As device-trees will be upstreamed separately, here is an example:
>>
>> stm32-pinctrl {
>>      rtc_rsvd_pins_a: rtc-rsvd-0 {
>>          pins {
>>              pinmux = <STM32_PINMUX('B', 2, AF1)>, /* OUT2 */
>>                       <STM32_PINMUX('I', 8, ANALOG)>; /* OUT2_RMP */
>>          };
>>      };
>> };
>>
>> stm32-rtc {
>>      pinctrl-0 = <&rtc_rsvd_pins_a &rtc_alarma_pins_a>;
>>
>>      /* Enable by foo-device */
>>      rtc_lsco_pins_a: rtc-lsco-0 {
>>          pins = "out2_rmp";
>>          function = "lsco";
>>      };
>>
>>      /* Enable by stm32-rtc hog */
>>      rtc_alarma_pins_a: rtc-alarma-0 {
>>          pins = "out2";
>>          function = "alarm-a";
>>      };
>> };
>>
>> foo-device {
>>      pinctrl-0 = <&rtc_lsco_pins_a>;
>> };
>>
> 
> This all seems good to me, I let you fix the various issues that have
> been reported. I was just wondering whether the LSCO clock was registered
> early enough to be used but I guess you tested that.
> 

Hi,

Here it is:
https://lore.kernel.org/lkml/20240717074835.2210411-1valentin.caron@foss.st.com/

Yes it works fine, RTC is probed early enough in the boot sequence, and 
so Wifi/BT module does not have an issue to get the LSCO clock.

Thanks,
Valentin

