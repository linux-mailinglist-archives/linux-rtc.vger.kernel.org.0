Return-Path: <linux-rtc+bounces-1729-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1D795DDEB
	for <lists+linux-rtc@lfdr.de>; Sat, 24 Aug 2024 14:48:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB16F2830E0
	for <lists+linux-rtc@lfdr.de>; Sat, 24 Aug 2024 12:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09E0B158DD9;
	Sat, 24 Aug 2024 12:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b="RTn94c7P"
X-Original-To: linux-rtc@vger.kernel.org
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094CA3B78D
	for <linux-rtc@vger.kernel.org>; Sat, 24 Aug 2024 12:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724503726; cv=none; b=rOwPcsCUixUAD5N8zPQXepXhIxS8yuoW7IkXk+Ne1JHQlfKSCdYAbeL+K4fmjAjEaIucCnYNjYbqrhvXJqVD88Qez0LBX7VDiZI8A9a+jdUK/tSX6fHHzqxdA01mRtjsdvXiy3IPwvDly172gFJbxTv2hKO6NOozBgnR0uHtzNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724503726; c=relaxed/simple;
	bh=oAkSmF+cYCdEB7uYm8iUKzBAbN4NB0WbHWiH32gKFhU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ieQnfj0ko1amdv5L/zFS73BChLm2eUVdWcgkGc89zBBZJrYaJ14lEktXZBJG0P2AXVcflaLnDxPUPAyFNp/A977zvDwCAHW025NEYjRdI8EpKkyk0pD/7Z3Qsb7iQGT6GnooXXsSJYw6onfecN2d0fAhxj601moMy/CsNVwaoos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com; spf=pass smtp.mailfrom=linumiz.com; dkim=pass (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b=RTn94c7P; arc=none smtp.client-ip=44.202.169.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linumiz.com
Received: from eig-obgw-5005a.ext.cloudfilter.net ([10.0.29.234])
	by cmsmtp with ESMTPS
	id hhJkshQ8WiA19hqCAsEWXA; Sat, 24 Aug 2024 12:48:42 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id hqC8s3rBNeCxMhqC9s0taf; Sat, 24 Aug 2024 12:48:42 +0000
X-Authority-Analysis: v=2.4 cv=M/yGKDws c=1 sm=1 tr=0 ts=66c9d6aa
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=yoJbH4e0A30A:10 a=vU9dKmh3AAAA:8 a=zVmcmtEpmNCJ3-i8KE8A:9
 a=QEXdDO2ut3YA:10 a=rsP06fVo5MYu2ilr0aT5:22 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PgEJ1MFlTP+nG6w+9BD92NttiBo/Pn+yMOkzb6Ras/k=; b=RTn94c7PbLlXFP8xDZUnI8ke1u
	wwMvb4NRk9PW23Ee7AbcJobq6l36QLv42sUpKgDamsP852cMaOgKXsn0rqYcZGuTEtbn1fSJ9En/a
	5eSEjmPNmYFqntZjNm+/TwZFSjlcGurjJ4A3RDL2qt1tSh0d/s2eZZjwdR+VGsK1rZgQA1FxT1DoN
	ZFaq3k15L7FmP9pFvl/EVzOqHqXD1YpFH+eAMKtjEAx7AY9qGp1V7dTWnzvud+uStVGd2B79+OIrm
	tXmUdPjusE+1RnSnZgv0PfP+Lp+vHUyeMfV+BipWY/04PXN23IZPXDo9RoMAN5igbedDkxEFfT89k
	gaR4+URA==;
Received: from [122.165.245.213] (port=45826 helo=[192.168.1.106])
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <karthikeyan@linumiz.com>)
	id 1shqC3-003ZFY-3D;
	Sat, 24 Aug 2024 18:18:36 +0530
Message-ID: <a5d4f421-5120-4421-944e-d39d67e482bb@linumiz.com>
Date: Sat, 24 Aug 2024 18:18:32 +0530
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] dt-bindings: arm: rockchip: Add Relfor Saib
To: Conor Dooley <conor@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 heiko@sntech.de, alexandre.belloni@bootlin.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
References: <20240823153528.3863993-1-karthikeyan@linumiz.com>
 <20240823153528.3863993-8-karthikeyan@linumiz.com>
 <20240823-lark-regime-0d3ab4215d69@spud>
Content-Language: en-US
From: karthikeyan <karthikeyan@linumiz.com>
In-Reply-To: <20240823-lark-regime-0d3ab4215d69@spud>
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
X-Exim-ID: 1shqC3-003ZFY-3D
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.106]) [122.165.245.213]:45826
X-Source-Auth: karthikeyan@linumiz.com
X-Email-Count: 2
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfDXezxjfP0mJG0P1wRQTnVqcDdRSKiH4q9JpHOCubknIa7zzNt23vY0NwThanlNE53+IJON5IKbgwhzbqs8mKq8KmQliwMInmMJeoj/3wwdY85zUY5z9
 WzNn3WDKBkT3FfX2mbGhC7Wv8S5DhVNC9HYgoXxf/wpBgTtQGQyDhX7B+CZsi0Bf1FIxFeplnYY6bE1Ro8Feh1Ou55V+nkyWLQo=

On 8/23/24 21:51, Conor Dooley wrote:
> On Fri, Aug 23, 2024 at 09:05:27PM +0530, Karthikeyan Krishnasamy wrote:
>> Add devicetree binding documentation for Relfor Saib
>> board which uses Rockchip RV1109 SoC
>>
>> Signed-off-by: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
>> ---
>>   Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
>> index 1ef09fbfdfaf..29f7e09ae443 100644
>> --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
>> +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
>> @@ -848,6 +848,12 @@ properties:
>>                 - radxa,zero-3w
>>             - const: rockchip,rk3566
>>   
>> +      - description: Relfor SAIB board
>> +        items:
>> +          - const: relfor,saib
>> +          - enum:
>> +              - rockchip,rv1109
> 
> This does not make sense to me. Why do you have an enum for the SoC
> model, implying that this SAIB board would have more than one possible
> SoC? I'd expect to see - const: rockvhip,rv1109
> 
There is an upcoming version of SAIB board based on Rockchip RV1103.
>> +
>>         - description: Rikomagic MK808 v1
>>           items:
>>             - const: rikomagic,mk808
>> -- 
>> 2.39.2
>>


