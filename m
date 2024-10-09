Return-Path: <linux-rtc+bounces-2122-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B331D9963A7
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Oct 2024 10:49:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4E301F214D2
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Oct 2024 08:49:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01B8A1917DE;
	Wed,  9 Oct 2024 08:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b="D753RUIG"
X-Original-To: linux-rtc@vger.kernel.org
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479561917C7
	for <linux-rtc@vger.kernel.org>; Wed,  9 Oct 2024 08:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728463485; cv=none; b=u/BHISgPmkWSBQU1wzC7ezQy3xrUQCSzljtqxe2cSle+J2CjWX/HyHu88+Z7abWSdKMx8ePbEnLpqCchXIx+l3z/bo75y6Db5HqaQ+kHHda8HT2UPsh2hnwH+HseIfcaO38+nj1g5sFcbQBYA1+21Yx6D7SerHo5AcxzCv28Ook=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728463485; c=relaxed/simple;
	bh=dvnsPxMliHeqbRIQiioXG8o912SFDQg2gZbzOnOIUoM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SKwWg6fsWa0txL3+ynEKUUMIp98JRCV0aB3aF+cYbbMCBd6/emDD7YpIGvqS6rZd+1dCF6/79XrwjJCcmJq/obpTo2u+claaAQFzYTRb8D9ijEFGPmXYdN0+MczWsai/GOnDzO84tsSh/N+uqu6n333YziBmAYo+r8K/bGSfjDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com; spf=pass smtp.mailfrom=linumiz.com; dkim=pass (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b=D753RUIG; arc=none smtp.client-ip=35.89.44.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linumiz.com
Received: from eig-obgw-6008a.ext.cloudfilter.net ([10.0.30.227])
	by cmsmtp with ESMTPS
	id yAA6sRImVqvuoySJCsfuzF; Wed, 09 Oct 2024 08:44:38 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id ySJ8sEe4HFyvuySJAsZCFV; Wed, 09 Oct 2024 08:44:36 +0000
X-Authority-Analysis: v=2.4 cv=TZeQtwQh c=1 sm=1 tr=0 ts=67064274
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=DAUX931o1VcA:10 a=-pn6D5nKLtMA:10 a=vU9dKmh3AAAA:8
 a=L2ZAzL5Tc2YXbkthkrQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rsP06fVo5MYu2ilr0aT5:22 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kjer777veAS4MsonIO7ZNfH7bB3CmtYfsy4XksivrrU=; b=D753RUIG2S8fD8Ru8o2mx55yae
	3fJdjxM1T8dU6bdAMMYpi2K3noLZ20hXFebknCjNlyB4/zpfbTYGS24Qh0LbmFzzyiFEdVwpDENwD
	CyJtohV6Les7xWAtw2AswcfooQd0N5WFK4hJejeAld9LhnDQWhODzdcAx4pg7c0iDxYE0Krx3ly4E
	hdvLDTTQluEKjqEpNt9a4MYI33gR5P0IW4M+nUIH0u/Xy//nTRM0R4Sq1lFEQW8QJ+TqtdL1nBCs5
	8mbjyGOuUztafcR/HO+9wDzpKHqO08+089fWXt+buLaVwF5KmBULkswmIYbyBERGor4EZYqIdk+hu
	9VDxWzxQ==;
Received: from [122.165.245.213] (port=35160 helo=[192.168.1.106])
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <karthikeyan@linumiz.com>)
	id 1sySJ2-00125N-1R;
	Wed, 09 Oct 2024 14:14:28 +0530
Message-ID: <1562366d-34eb-4698-a722-d9e2d400397f@linumiz.com>
Date: Wed, 9 Oct 2024 14:14:25 +0530
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] dt-bindings: watchdog: rockchip: Add
 rockchip,rv1126-wdt string
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, alexandre.belloni@bootlin.com,
 wim@linux-watchdog.org, linux@roeck-us.net
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20240912142451.2952633-1-karthikeyan@linumiz.com>
 <ddca4051-0e83-4d39-8654-12210ffa5685@linumiz.com>
 <37e26b46-2f6a-4db4-b003-59088ef1dcc1@linumiz.com> <1988046.PYKUYFuaPT@diego>
Content-Language: en-US
From: karthikeyan <karthikeyan@linumiz.com>
In-Reply-To: <1988046.PYKUYFuaPT@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 122.165.245.213
X-Source-L: No
X-Exim-ID: 1sySJ2-00125N-1R
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.106]) [122.165.245.213]:35160
X-Source-Auth: karthikeyan@linumiz.com
X-Email-Count: 2
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfO8SEremXvG18PA08qfu2sfOf+eV9aBo3k4MmcLfuiBb7YepVJleG43UrIrwGcQ8rLE5uXJ4osVEAN507q+h9w6N0s7VjztqiKh2dagGsSX6UJ0EcveL
 5aIPL3lj6ymSb0VTTYXHnZV7yqHhj/E9aZNQxusYJxR0SzfKY6sU7qRMq/KemrLHsKm0ZZFVywqARLdCHfjPzfMj1BytFMBRpzc=



On 10/9/24 00:56, Heiko Stübner wrote:
> Hi,
> 
> Am Montag, 7. Oktober 2024, 15:56:58 CEST schrieb karthikeyan:
>>
>> On 9/18/24 12:59, karthikeyan wrote:
>>>
>>>
>>> On 9/18/24 04:46, Heiko Stuebner wrote:
>>>> Hey,
>>>>
>>>> Am Donnerstag, 12. September 2024, 16:24:46 CEST schrieb Karthikeyan
>>>> Krishnasamy:
>>>>> Add rockchip,rv1126-wdt compatible string.
>>>>>
>>>>> Signed-off-by: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
>>>>
>>>> I think this patch misses some recipients because neither
>>>> the watchdog maintainers nor the watchdog list is included.
>>>>
>>>> We'll need for them to at least Ack this patch, so they'll
>>>> need to be included. Please check your scripts/get_maintainer.pl
>>>> call
>>>>
>>>>
>>>> Thanks
>>>> Heiko
>>>>
>>> Apologies for missing them. Adding them in this reply mail.
> 
> I don't think that will have worked.
> 
> Ideally can you include Conor's Ack and resend only the watchdog binding
> patch to the watchdog maintainers (and lists and me too please) .
> 
> Because just adding more people to a reply probably won't tell them
> that some action is expected.
> 
> Heiko
> 
> 

Thanks for your info. It's my mistake. I will resend the watchdog patch 
alone.

Best regards,
Karthikeyan

