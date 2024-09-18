Return-Path: <linux-rtc+bounces-2017-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E4A97B888
	for <lists+linux-rtc@lfdr.de>; Wed, 18 Sep 2024 09:29:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20B291C21440
	for <lists+linux-rtc@lfdr.de>; Wed, 18 Sep 2024 07:29:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07E8216D9AF;
	Wed, 18 Sep 2024 07:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b="M1RuQaED"
X-Original-To: linux-rtc@vger.kernel.org
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E2F165F04
	for <linux-rtc@vger.kernel.org>; Wed, 18 Sep 2024 07:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726644584; cv=none; b=udXphSDGzvp3mtXMlgEEKovobdHdqlnNjSskCNArwC8Uv9bmXPiHUCXGsYQ/YPF05JHGVsYjBIX9lerzyUhIZ8ut5Fn1Yr3VBOgqPYr/nOcf1vFVjEfPQiFI+0gEx1jjJoQk6k0Dzw5sYv0QDt0kaj+YqbK21HXngY8UbuJO15M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726644584; c=relaxed/simple;
	bh=yP0aZDcQLjQJHAwqB/Fw8rs6y8tndFngO8tTKM8vLdU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NhSkALvIHRHPmBudd60NI1VLn7S7jp6mtuFmupYd+zQUnN/sHxqbzTuAFTXbpnpYskSDDjkYWiqG4s0KwUev5UxVy7FpjVOjB1qvmiBCcL5izpbpAYh14UGlKsXQlqE0QCqF651HRKZZTivmvbMY2bymGPOQY0Xlz3faUleqxSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com; spf=pass smtp.mailfrom=linumiz.com; dkim=pass (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b=M1RuQaED; arc=none smtp.client-ip=44.202.169.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linumiz.com
Received: from eig-obgw-5010a.ext.cloudfilter.net ([10.0.29.199])
	by cmsmtp with ESMTPS
	id qYGssyubFnNFGqp89sLLTl; Wed, 18 Sep 2024 07:29:41 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id qp86skJHiIQwZqp87siQy4; Wed, 18 Sep 2024 07:29:40 +0000
X-Authority-Analysis: v=2.4 cv=FModxfos c=1 sm=1 tr=0 ts=66ea8164
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=EaEq8P2WXUwA:10 a=-pn6D5nKLtMA:10 a=vU9dKmh3AAAA:8
 a=EfumUPoKJa0OZNXMQWIA:9 a=QEXdDO2ut3YA:10 a=rsP06fVo5MYu2ilr0aT5:22
 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Bsh0+YTIBF2g9B4a29qrB1FFLWx62R+OsNpok7/VG0c=; b=M1RuQaED7/rSKCPTvoomTTe3wM
	0SbdHGTITSV/ErpEZsSl0iLV0Bxw1WXMQyEAqxMQbzDJ6j8dryEQOirTTkBgI/iDXn0YxHpRSUo2V
	41Jii4EIjhpW+xZOkEGb23l8aUnlGP3iCCnnaIZ0eeVI9VA1rxs8WpT1VeFtx0v4gA3TKybazWz0S
	TI/4PkOcsTfY5TjQ8s/8hDcYCwLKdACetM7I0iM/64KH+QQiEresGITqiEd7NPhkNMPppXNuV78Qs
	Q/Ug9bMheh0ZexztgAIed/Jv84tsqKgY68PURgvsFlyvS0CmjJlUePqb7NTGA3mzgTR+6+TLlWRPT
	s/BA7krg==;
Received: from [122.165.245.213] (port=51864 helo=[192.168.1.106])
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <karthikeyan@linumiz.com>)
	id 1sqp80-0028P1-1L;
	Wed, 18 Sep 2024 12:59:32 +0530
Message-ID: <ddca4051-0e83-4d39-8654-12210ffa5685@linumiz.com>
Date: Wed, 18 Sep 2024 12:59:28 +0530
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] dt-bindings: watchdog: rockchip: Add
 rockchip,rv1126-wdt string
To: Heiko Stuebner <heiko@sntech.de>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, alexandre.belloni@bootlin.com, wim@linux-watchdog.org,
 linux@roeck-us.net
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20240912142451.2952633-1-karthikeyan@linumiz.com>
 <20240912142451.2952633-2-karthikeyan@linumiz.com> <2206048.Mh6RI2rZIc@phil>
Content-Language: en-US
From: karthikeyan <karthikeyan@linumiz.com>
In-Reply-To: <2206048.Mh6RI2rZIc@phil>
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
X-Exim-ID: 1sqp80-0028P1-1L
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.106]) [122.165.245.213]:51864
X-Source-Auth: karthikeyan@linumiz.com
X-Email-Count: 2
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfLAYdJ5SxnfIycOweFgt/Dl9A+2qS7NGrnebeaHYiEnk9O5UxpjyQHbOv+O+5X8KkGIGTwvL9ATllRsm2s2aB+00LVytAIqGptxjSZHF7zW+fpZoYcA8
 ODZR2NZSCl0GgoCGa56YjfSi7uTpxoI0sdjTRHW+UQYYi7R6/Z7jc7a6rMzJqJZcace4wxN0wb72Ab3hbgagvycCmlKrGwvg1ec=



On 9/18/24 04:46, Heiko Stuebner wrote:
> Hey,
> 
> Am Donnerstag, 12. September 2024, 16:24:46 CEST schrieb Karthikeyan Krishnasamy:
>> Add rockchip,rv1126-wdt compatible string.
>>
>> Signed-off-by: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
> 
> I think this patch misses some recipients because neither
> the watchdog maintainers nor the watchdog list is included.
> 
> We'll need for them to at least Ack this patch, so they'll
> need to be included. Please check your scripts/get_maintainer.pl
> call
> 
> 
> Thanks
> Heiko
> 
Apologies for missing them. Adding them in this reply mail.
>> ---
>>
>> Notes:
>>      v3:
>>      - add watchdog compatible string
>>
>>   Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
>> index c7aab0418a32..bccd27a1e470 100644
>> --- a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
>> +++ b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
>> @@ -31,6 +31,7 @@ properties:
>>                 - rockchip,rk3568-wdt
>>                 - rockchip,rk3588-wdt
>>                 - rockchip,rv1108-wdt
>> +              - rockchip,rv1126-wdt
>>             - const: snps,dw-wdt
>>   
>>     reg:
>>
> 
> 
> 
> 

Best Regards,
Karthikeyan

