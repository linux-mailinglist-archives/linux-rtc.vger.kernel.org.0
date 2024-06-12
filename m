Return-Path: <linux-rtc+bounces-1284-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA584904EF1
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Jun 2024 11:16:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C1B1281AC7
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Jun 2024 09:16:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BE5716D9BB;
	Wed, 12 Jun 2024 09:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b="rk0dAULC"
X-Original-To: linux-rtc@vger.kernel.org
Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63989B651;
	Wed, 12 Jun 2024 09:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.68.50.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718183773; cv=none; b=ftGqYZ4uVm+v1vn7Yxc0YSnukyThVsi1prLHkb6eOesshjl30JIbMAZYSxwqQEU7otXVUZAEcVfLoeXhnu7bAhXICDa4ksNDMZei3dMrugTyHuvBi1KNFi9DIjQsWc8JhUEFEqsJ1r4e9ZUPg1z+OsmYHPibt5lkvPMTwXDmLek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718183773; c=relaxed/simple;
	bh=xdbpE2JCMKwdKOF8sjjQ6y8Q3Mxyjf77mkVC2M2aTaI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jfd+Z3eoWYgJu9ClFt67pVGvzmLHH1ckz4TUF8g4A76no2MWJvgclC4XwDPcYATEuDUMEMt7w3yDuCgM32mIyS0GjV11zwOp1emqDannVTEv6lDoqXpbDWu127xCcG5ZoYoaYOR+QR7By10VBkpaWZJvEo7xi59noCxxdSyUEhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=prolan.hu; spf=pass smtp.mailfrom=prolan.hu; dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b=rk0dAULC; arc=none smtp.client-ip=193.68.50.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=prolan.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prolan.hu
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 97165A079B;
	Wed, 12 Jun 2024 11:16:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=mmPk5kCKWrmDVuiuhfZm
	ueQWwvGTObFOeHEn10Q851Y=; b=rk0dAULCGDj84NLQzN8snUnDjM2QlRWlutrD
	lmCtBcV7SL6csL55N7Ks+sDiEZKHXxzWuF18+GzyO9/rrZyOzK2LwJ7FdB/FtfwU
	kPt+K+33LKFL6kH8J8unzwb5o5bBUcn3hnjrz05IoGp0K8NDltfTUP3nkpUTiuVn
	k4fb6cozj4Dp0BMJdBJY2y9q7sMgaNBwDNTrZ/d3qr71yhTw2uA13AIUDyihUVR7
	jtcfoqW1WXhJvXEyCJo+4s9ir1nlmtDV8SduIVOQBjEyPOSce2GmcJSDdAyu4Ca9
	TxpcNekweSS9oEFzA1iEg4PvwBl9gBX2EpPhd3Y1rt5saNVvhoSXNkB7xKipbHQQ
	qXuiaIDQqhePNy00jlWO9CRZebZz9K1D+qBb/1Ids6MelpxqvcUzZuUKdYz+vAGj
	hazCeK537yyZdrrbi2wDCBSzZska2g+CSyerYSXaX734gKmq6yrCWazR0HfoCjGi
	Cgx3jNDjBTexvG2sOmKfae5Iv0Bo7dQIBBw7bvhOiHGekArn92T0LgSBS8/iOelU
	qGDA7bn9r3YDehXCGCjk/cxVNrramCmY/xqsbcUghK3DBkas4e8NmmMNM6G6umBH
	lWjsi8fnyo17SgW+F6mDVIPc3ZJj/c3zzmrtpTYUfbrvcpZZif713BpdmPtT4RMG
	63ivsg4=
Message-ID: <c0b6ad83-b9d4-43e7-8c1a-14b71a2060f8@prolan.hu>
Date: Wed, 12 Jun 2024 11:16:02 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2] rtc: pcf2127: Add PPS capability through Seconds
 Interrupt
To: Miroslav Lichvar <mlichvar@redhat.com>, Richard Cochran
	<richardcochran@gmail.com>
CC: <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	=?UTF-8?Q?Szentendrei=2C_Tam=C3=A1s?= <szentendrei.tamas@prolan.hu>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20240611150458.684349-1-csokas.bence@prolan.hu>
 <Zmks31shpsnoLQ3k@hoboy.vegasvil.org> <ZmlTQsgRiW9fmYcB@localhost>
Content-Language: en-US
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <ZmlTQsgRiW9fmYcB@localhost>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2945A129576D7567

On 6/12/24 09:50, Miroslav Lichvar wrote:
> On Tue, Jun 11, 2024 at 10:06:39PM -0700, Richard Cochran wrote:
>> On Tue, Jun 11, 2024 at 05:04:57PM +0200, Csókás, Bence wrote:
>>
>>> PCF2127/29/31 is capable of generating an interrupt on every
>>> second (SI) or minute (MI) change. It signals this through
>>> the Minute/Second Flag (MSF) as well, which needs to be cleared.
>>
>> This is a RFC, and my comment is that a PPS from an RTC is not useful
>> to the Linux kernel.
> 
> I think a TCXO-based RTC can be useful to user space to improve
> holdover performance with NTP/PTP.

Exactly.

> There already is the RTC_UIE_ON
> ioctl to enable interrupts and receive them in user space.
> 
> The advantage of the PPS device over the ioctl would be more accurate
> timestamping (kernel vs user-space). Should PPS be supported, it would
> be nice if it worked generally with all drivers that support RTC_UIE_ON.

As we've discussed in v1, UIE hardware support is being removed from the 
RTC subsystem, which I tried to optionally re-introduce. Since there was 
no response since then, I assumed that there is no willingness to do 
that, so I chose the next best option, the PPS subsystem.

On 5/28/24 19:56, Alexandre Belloni wrote:
 > This has been removed from the kernel 13 years ago. What is your use
 > case to reintroduce it?

I also agree that multiple RTCs would benefit from this feature. 
However, we should only add it to those which *have* hardware support 
for a "one second has elapsed" signal. UIE is currently implemented by 
setting an alarm to the next second, which didn't work well with the 
PCF2129.

Bence


