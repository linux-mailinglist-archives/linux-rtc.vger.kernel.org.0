Return-Path: <linux-rtc+bounces-4144-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F828AC31CA
	for <lists+linux-rtc@lfdr.de>; Sun, 25 May 2025 00:28:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93A60189B37F
	for <lists+linux-rtc@lfdr.de>; Sat, 24 May 2025 22:28:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE22327C162;
	Sat, 24 May 2025 22:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KSr/nbjR"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9D217B506;
	Sat, 24 May 2025 22:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748125702; cv=none; b=iulSghgvNvciTQ0c4GTbnG1IKEsJHbpU5YwxVyKylaeLbEcHXTHHQ9YkN236mxVF0bKLnAnBGcsYMEq0jAzR5Dr+ACKiNkPvNqI/tXxALNVIKItxDOvVtRHHzh0fwmGAqdNCeQ5sLui7QSEeXx2yZm4ct5eMT3OFcgaCrpe1RxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748125702; c=relaxed/simple;
	bh=jWq0ex1AQAEiET0qc4liQ/5fmCSQqfggZ3TOlwcfK6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H+DCO/curirsOYPDrMGMEQIR4JSFx2VqyxSiglWDTDjBSWyDNoM6Gpe35Afajp4QlE9ouYNRwWlDMvOEGGJYb+fPR+ZUmV0jhBfxktFx2aLfpG3VzjGZWuwMVJKmz3g666bIyY1jKzSPsFmaWmRYi9WKRWIZnZzAwioA0MMlOqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KSr/nbjR; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 95D7741C93;
	Sat, 24 May 2025 22:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748125698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8y+QOWU43n1T13VyqswY27wl2gnGcpvM+vA/SjWpyGk=;
	b=KSr/nbjR4GrbpXmjK8WIrU+grEjPmisDIlDt6zJ9GsVUoGy6TKApn95mQFLSnSIhiGVsde
	ErUrTW8Cwg0gbe/qThFhKoJfekuxTeU/Mm3UFPGZGjlNfhpSqTaaipUVBA/Gu0xgxr5Ial
	DMyYSymT0BgKbYIycffBVN1nBhKVP7gJCym5E1Rz85aAsxZj3FBquaJ+qJ6BA/Yj0djIl1
	M24gvu0BYvJPguJYG5RnB4eAAEBTTFVZ1h7zLHWcvu+gDWhcVbkupXNGUJdl4cu9qKisC8
	ydyaH4PTJfblqEMY007vfwPVvmw/fd5/mRcz1gZffx3oX8FlQdfn35kE/ybETw==
Date: Sun, 25 May 2025 00:28:17 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: zhoubinbin@loongson.cn, wangming01@loongson.cn,
	Liu Dalin <liudalin@kylinsec.com.cn>
Cc: chenhuacai@kernel.org, gaojuxin@loongson.cn, git@xen0n.name,
	jiaxun.yang@flygoat.com, keguang.zhang@gmail.com,
	lixuefeng@loongson.cn, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] rtc: loongson: Add missing alarm notifications for
 ACPI RTC events
Message-ID: <174812515308.1273250.15722574329194803657.b4-ty@bootlin.com>
References: <20250429062736.982039-1-liudalin@kylinsec.com.cn>
 <20250509084416.7979-1-liudalin@kylinsec.com.cn>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509084416.7979-1-liudalin@kylinsec.com.cn>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdduvdeltdculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeefhfffkeejueehveeuveejvdelveejteduffehuedtffdufeejudffuedvtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddupdhrtghpthhtohepiihhohhusghinhgsihhnsehlohhonhhgshhonhdrtghnpdhrtghpthhtohepfigrnhhgmhhinhhgtddusehlo
 hhonhhgshhonhdrtghnpdhrtghpthhtoheplhhiuhgurghlihhnsehkhihlihhnshgvtgdrtghomhdrtghnpdhrtghpthhtoheptghhvghnhhhurggtrghisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrghojhhugihinheslhhoohhnghhsohhnrdgtnhdprhgtphhtthhopehgihhtseigvghntdhnrdhnrghmvgdprhgtphhtthhopehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmpdhrtghpthhtohepkhgvghhurghnghdriihhrghnghesghhmrghilhdrtghomh
X-GND-Sasl: alexandre.belloni@bootlin.com

On Fri, 09 May 2025 16:44:16 +0800, Liu Dalin wrote:
> When an application sets and enables an alarm on Loongson RTC devices,
> the alarm notification fails to propagate to userspace because the
> ACPI event handler omits calling rtc_update_irq().
> 
> As a result, processes waiting via select() or poll() on RTC device
> files fail to receive alarm notifications.
> 
> [...]

Applied, thanks!

[1/1] rtc: loongson: Add missing alarm notifications for ACPI RTC events
      https://git.kernel.org/abelloni/c/5af9f1fa5768

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

