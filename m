Return-Path: <linux-rtc+bounces-2102-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CFD992E03
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Oct 2024 15:57:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC343281469
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Oct 2024 13:57:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D5331D5ADE;
	Mon,  7 Oct 2024 13:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b="lgJdqFNP"
X-Original-To: linux-rtc@vger.kernel.org
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DFC1D5AAD
	for <linux-rtc@vger.kernel.org>; Mon,  7 Oct 2024 13:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728309440; cv=none; b=n1FimgdZLl0t2+cgHnmryOBSSW6ITZ0DZgKuGe4ac9/6hzdDlEk05rViTlKEWvMHYrJI7xTsoc69Bzy1ibgwvKnb27mrhWrmCwhzuv5F/RlOhletv3aB+PfSoUr2Rbw06Kxsl2W2vfMAu3IJgakQAOqgiT96VpuoVlWgsb68mXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728309440; c=relaxed/simple;
	bh=HOEKULFkE6M5CuqjOFFK1AS4/LojYVdTc6S43XpVQX0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=e/5PqKUVhnxtR71mq2WH/i/1tZQ60ELKPqbg/9tvq/HgHM90aWN4zsHb2VeP9PAXnXS/oNtCbMEv9DmqyiTI67lmg1DPrkrsXxF7Kx8s+DsyjhFIx5R2N1D+HABz0UED+Nf9TAJykbD6hy53XyE+Cuigox+VUgtsEZMZ5e0ID+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com; spf=pass smtp.mailfrom=linumiz.com; dkim=pass (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b=lgJdqFNP; arc=none smtp.client-ip=35.89.44.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linumiz.com
Received: from eig-obgw-6010a.ext.cloudfilter.net ([10.0.30.248])
	by cmsmtp with ESMTPS
	id xnpysSNJKVpzpxoEaswzHh; Mon, 07 Oct 2024 13:57:12 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id xoEXsc8vKYvcPxoEYsGjuj; Mon, 07 Oct 2024 13:57:11 +0000
X-Authority-Analysis: v=2.4 cv=TceQtwQh c=1 sm=1 tr=0 ts=6703e8b7
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=DAUX931o1VcA:10 a=-pn6D5nKLtMA:10 a=vU9dKmh3AAAA:8
 a=KpWdpyGzixcpRlYuMWcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rsP06fVo5MYu2ilr0aT5:22 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:
	Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Off8ca3Q8QoJ3XNFUGaDvWVL6Usji4QPjLFIyyxfzWQ=; b=lgJdqFNPc5I3BQUntvm/jLl8CC
	LEM1XeCTXgDIcoW0wm/IhAE6kVF4k0HW0Ez4oG80HvZsNCQvdJfrlBNXzEYRRCPCUfwRRagCZV6hJ
	YzO4AY/jYqeoI8J3eu8HrxwmqviF1OuxbLazzZ1CLUD+PGztUC4lUWaX+ECIuHwGv1kTsYmFf/4V4
	Q6I3mjQM1v2/zZmsQeEaNhxKT1W6l7V47RYOoKgV8O2w5A9v/N1TvNGcOvykt5hKCj6F+kN6i7OCe
	d6Y2mG2rd8/GLpP6vJXl1fp9mIUTQ1dGdDToGf/OZJaYjIYE0woskmqXabCEuo1JUEekzhwKPdsK5
	sXmoxyVQ==;
Received: from [122.165.245.213] (port=56716 helo=[192.168.1.106])
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <karthikeyan@linumiz.com>)
	id 1sxoER-003Hi5-01;
	Mon, 07 Oct 2024 19:27:03 +0530
Message-ID: <37e26b46-2f6a-4db4-b003-59088ef1dcc1@linumiz.com>
Date: Mon, 7 Oct 2024 19:26:58 +0530
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] dt-bindings: watchdog: rockchip: Add
 rockchip,rv1126-wdt string
From: karthikeyan <karthikeyan@linumiz.com>
To: Heiko Stuebner <heiko@sntech.de>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, alexandre.belloni@bootlin.com, wim@linux-watchdog.org,
 linux@roeck-us.net
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20240912142451.2952633-1-karthikeyan@linumiz.com>
 <20240912142451.2952633-2-karthikeyan@linumiz.com> <2206048.Mh6RI2rZIc@phil>
 <ddca4051-0e83-4d39-8654-12210ffa5685@linumiz.com>
Content-Language: en-US
In-Reply-To: <ddca4051-0e83-4d39-8654-12210ffa5685@linumiz.com>
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
X-Exim-ID: 1sxoER-003Hi5-01
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.106]) [122.165.245.213]:56716
X-Source-Auth: karthikeyan@linumiz.com
X-Email-Count: 2
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfAJR2dOgvT4dV/f1teBat/3ViU06rkWay7Kf5TMwEz1HXU00FoDj/7F3Bmb6UaiS6hV6QXl27gWRtm3sH/hv+vamCK9ZsKs6hRb0b2o3iiFZDYC196l7
 w7K72mC7yb0DQZ5UdEgPU8w2edZzApNArnuu6ZOSCiJvumY1a+Fhi5jQnYvbkzmbdrU/cKlZ16kr4/8mzvPiRVaUvehAxylXGdU=



On 9/18/24 12:59, karthikeyan wrote:
> 
> 
> On 9/18/24 04:46, Heiko Stuebner wrote:
>> Hey,
>>
>> Am Donnerstag, 12. September 2024, 16:24:46 CEST schrieb Karthikeyan 
>> Krishnasamy:
>>> Add rockchip,rv1126-wdt compatible string.
>>>
>>> Signed-off-by: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
>>
>> I think this patch misses some recipients because neither
>> the watchdog maintainers nor the watchdog list is included.
>>
>> We'll need for them to at least Ack this patch, so they'll
>> need to be included. Please check your scripts/get_maintainer.pl
>> call
>>
>>
>> Thanks
>> Heiko
>>
> Apologies for missing them. Adding them in this reply mail.
>>> ---
>>>
>>> Notes:
>>>      v3:
>>>      - add watchdog compatible string
>>>
>>>   Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git 
>>> a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml 
>>> b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
>>> index c7aab0418a32..bccd27a1e470 100644
>>> --- a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
>>> +++ b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
>>> @@ -31,6 +31,7 @@ properties:
>>>                 - rockchip,rk3568-wdt
>>>                 - rockchip,rk3588-wdt
>>>                 - rockchip,rv1108-wdt
>>> +              - rockchip,rv1126-wdt
>>>             - const: snps,dw-wdt
>>>     reg:
>>>
>>
>>
>>
>>
> 
> Best Regards,
> Karthikeyan

Gentle remainder.

Best Regards,
Karthikeyan

