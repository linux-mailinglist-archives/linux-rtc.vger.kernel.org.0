Return-Path: <linux-rtc+bounces-1753-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD37962352
	for <lists+linux-rtc@lfdr.de>; Wed, 28 Aug 2024 11:23:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 13B16B222AA
	for <lists+linux-rtc@lfdr.de>; Wed, 28 Aug 2024 09:23:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCE7615B141;
	Wed, 28 Aug 2024 09:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b="l2gyZteW"
X-Original-To: linux-rtc@vger.kernel.org
Received: from omta034.useast.a.cloudfilter.net (omta034.useast.a.cloudfilter.net [44.202.169.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE2F16087B
	for <linux-rtc@vger.kernel.org>; Wed, 28 Aug 2024 09:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724836996; cv=none; b=FYNIigX1T4IPPyDCOeqQo4odE4bdTSG/vTY/zVUoVMaqmD1rALnAMoRnRfKUT0IHwlMg+GjLZ9dkWrYhEOyrwM6HvpeUGuPwT7y0hm5L/4876gEoF1nSbwyw67ggqWed5xEU9dSEQgEmladJt9MN1LaFa4ZTTibd+opvEfV4wuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724836996; c=relaxed/simple;
	bh=jxYnIslH6HYkg4T0/mYqNw1DQIwt8CU5u74tlXFV1aE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=THzHVIdVMXt3enPe+BQYXL9Mzp7DcBHFVrXRKbxcoh/h9BiLRLO1KkFNaCyEVD1YNnShC4CeQDgR0duLmTYoC2EeEOLl/kQPxYTTT/uztFiEIvVdNgDs7TuAkkxWHJ7M4UwbUcLxOSbvR/vXh7gkZAmd+o7VBnVK2IgGh26NwJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com; spf=pass smtp.mailfrom=linumiz.com; dkim=pass (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b=l2gyZteW; arc=none smtp.client-ip=44.202.169.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linumiz.com
Received: from eig-obgw-6006a.ext.cloudfilter.net ([10.0.30.182])
	by cmsmtp with ESMTPS
	id jCI9s6MAP1zuHjEtVsySgX; Wed, 28 Aug 2024 09:23:14 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id jEtSslvrhZcP5jEtTsgrxE; Wed, 28 Aug 2024 09:23:12 +0000
X-Authority-Analysis: v=2.4 cv=eubZzJpX c=1 sm=1 tr=0 ts=66ceec80
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=yoJbH4e0A30A:10 a=-pn6D5nKLtMA:10 a=vU9dKmh3AAAA:8
 a=M-OHScM7UXdo8wPXp2IA:9 a=QEXdDO2ut3YA:10 a=rsP06fVo5MYu2ilr0aT5:22
 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7MLyh0ZMj/waRkEMqu5NvgdgV0+LWDWuoIenoixpKGw=; b=l2gyZteWv7EYdzX/4or9dLknID
	RGoc9pGyxup2y0WQL0LOCFxAwDcJT6z145RenV3kVY4TT9/cXoQYHu4TztYLqo6wpoFfv8HiLOh2h
	B9bqQoAhbyQWcjwmfIGTfHakVJFKSPNUut76T9i6QxRkPK2ARorZWRyvxrEe0PLSHsCw94eB7Fdbi
	GXdbT0sIeBapRRyJYFn6j+ObD/Yoih/cXdwPJ9A2PQRzngGoczHALepITGf7opJ2MKYTipvdoFJdK
	e6r6STKaBCZWBFCODAblZJAasuSlQ8IdxiDcmm+wlvKRMnUBDH02HARr32cKNXTaKFbUo6OxTEQdb
	gzwgc8BQ==;
Received: from [122.165.245.213] (port=38254 helo=[192.168.1.106])
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <karthikeyan@linumiz.com>)
	id 1sjEtM-002IZN-1L;
	Wed, 28 Aug 2024 14:53:04 +0530
Message-ID: <207109b6-0b07-45dd-8143-f6e07cc427d8@linumiz.com>
Date: Wed, 28 Aug 2024 14:53:01 +0530
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] dt-bindings: arm: rockchip: Add Relfor Saib
To: Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 heiko@sntech.de, alexandre.belloni@bootlin.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
References: <20240823153528.3863993-1-karthikeyan@linumiz.com>
 <20240823153528.3863993-8-karthikeyan@linumiz.com>
 <20240823-lark-regime-0d3ab4215d69@spud>
 <a5d4f421-5120-4421-944e-d39d67e482bb@linumiz.com>
 <9537c866-cddc-4958-86a8-d097982067cd@kernel.org>
Content-Language: en-US
From: karthikeyan <karthikeyan@linumiz.com>
In-Reply-To: <9537c866-cddc-4958-86a8-d097982067cd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 122.165.245.213
X-Source-L: No
X-Exim-ID: 1sjEtM-002IZN-1L
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.106]) [122.165.245.213]:38254
X-Source-Auth: karthikeyan@linumiz.com
X-Email-Count: 3
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfMQ2J2MpT4N6il8Mja8a8opec5aB/cWMfxTnpACi+if5Zsx2k7jFbwkeKp1SGrWSsVQ2w9fCH9jD1IytrNdv7NgQrJq1hV/hmgHDPJ44tgfzzE0lgGXT
 Y7cbkWo+YTUCbHSkqPsnzZJrCMcTlS+uApikWondytxqO0/tXhDgE/YXZ86jJvLPP9O0Rmfti6G20Mvp09fVV1+Kv7C0sPsmLjA=



On 8/26/24 14:03, Krzysztof Kozlowski wrote:
> On 24/08/2024 14:48, karthikeyan wrote:
>> On 8/23/24 21:51, Conor Dooley wrote:
>>> On Fri, Aug 23, 2024 at 09:05:27PM +0530, Karthikeyan Krishnasamy wrote:
>>>> Add devicetree binding documentation for Relfor Saib
>>>> board which uses Rockchip RV1109 SoC
>>>>
>>>> Signed-off-by: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
>>>> ---
>>>>    Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++++
>>>>    1 file changed, 6 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
>>>> index 1ef09fbfdfaf..29f7e09ae443 100644
>>>> --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
>>>> +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
>>>> @@ -848,6 +848,12 @@ properties:
>>>>                  - radxa,zero-3w
>>>>              - const: rockchip,rk3566
>>>>    
>>>> +      - description: Relfor SAIB board
>>>> +        items:
>>>> +          - const: relfor,saib
>>>> +          - enum:
>>>> +              - rockchip,rv1109
>>>
>>> This does not make sense to me. Why do you have an enum for the SoC
>>> model, implying that this SAIB board would have more than one possible
>>> SoC? I'd expect to see - const: rockvhip,rv1109
>>>
>> There is an upcoming version of SAIB board based on Rockchip RV1103.
> 
> Still wrong form multiple points of view:
> 1. Not logical, we never expect such entry in top level bindings,
> 2. Same board or different? If same, how is it possible to have two
> different SoCs (not modules!) in the same board? These are different
> boards. Or maybe this uses some SoM, but your commit msg explained
> nothing about this.
> 
> You have entire commit msg to explain the hardware. Use it, so you don't
> get such questions.
> 
> The code above: NAK
It's my mistake, previously my understanding about this binding was 
wrong. I will change it in v2 patch.>
> Best regards,
> Krzysztof
> 
Thanks,
Karthikeyan

