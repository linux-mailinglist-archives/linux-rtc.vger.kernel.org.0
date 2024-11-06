Return-Path: <linux-rtc+bounces-2464-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3249BDA0A
	for <lists+linux-rtc@lfdr.de>; Wed,  6 Nov 2024 01:03:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E965A1C2232C
	for <lists+linux-rtc@lfdr.de>; Wed,  6 Nov 2024 00:03:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6102C10E3;
	Wed,  6 Nov 2024 00:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kXuC5YVE"
X-Original-To: linux-rtc@vger.kernel.org
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E421646;
	Wed,  6 Nov 2024 00:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730851407; cv=none; b=S2C+pSq0E40Em0KLyTBpCpvlLPk/ubDbYIxvbiTvjPQk0IN1/8mdDo1IRwGsNkCZut8Zwq/tLydM+4Xw9PJ2mkTI7UoYtkftfh9ncG1GTYN/JbmhR8TQaNbXGazkri40cPJAPiWOOCofomujfZX214+lpjEHRz+VI/ujL7dXPkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730851407; c=relaxed/simple;
	bh=eAjcKNJGuGYhCN33fl+cRNOSxAAiOyExXZxDkoLD8TU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=llTsOd+VASOx839+JE0h8naz54gQrFOGO5/+vL1HD6c/2rbu6CLbnoT/U5mvFNrY60xjjRB1dVoxg688gsrXBuFbo4X7iPs/y9SDiEbYI4fAapR4BUBhP5supW9ucQsAkMe8UeZ1+W9wf+m2WWkvLb12uvtBYKgnT+J131bvoq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kXuC5YVE; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id 4C759114012E;
	Tue,  5 Nov 2024 19:03:24 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Tue, 05 Nov 2024 19:03:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1730851404; x=1730937804; bh=I4aE014BRSWlaQQuqnoEIRlCe+KYuLBoJLE
	FrJEzW6M=; b=kXuC5YVExg/qK7qQu94xZO3cvAlqtLcvUQQObdSrwWfLAFMpHt3
	El8olj3LHeulEGLdk4HmeTmKLSBXXQ4Nll/dtp84Sp5dOxkGXjx2LGi2RRD4nsli
	cA5fbM+WxhpsYGpmBh0kv36XLYlOqmS5GLwdjdfN1/RciA32Ywh5wFtdQTn8eT/2
	z5n2uc5Hrh0/oRWUYPjvL4lB3wFfwgbhftkbdK0NzSKEKTvK2NURBFLuh3JtrMAb
	Y5aYhoLNykHu2UMLgnNt24Sqm4W7jBGRJsa41y9jNVjL4+NDhPgWmH2CWG5NUK+7
	NfNOI2UpNtsqUDQ0hw8Y4Zx8BzajfSTsuOQ==
X-ME-Sender: <xms:S7IqZzcVwkTxj92ZU-DRV3QUwTeG2A8UiWou06rG5k6MZYw1QRLEsA>
    <xme:S7IqZ5OOXC6vrM5Yw99Ghnzz9YCC4lx2sR1x2xnV3f-9QYAheS757tMGWur3c_YVw
    lG6pmiM3RLpc0DbVYw>
X-ME-Received: <xmr:S7IqZ8geZcbnG4LvJSKgPWas7UqBw01mkZPCimC56clVzuhyFGAKSDo_Xjtn5ZjJnPWu165VdEpPMqEJ4158jVm643N5-TGBI_I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrtddugddukecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfh
    rhhomhephfhinhhnucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdroh
    hrgheqnecuggftrfgrthhtvghrnhepleeuheelheekgfeuvedtveetjeekhfffkeefffff
    tdfgjeevkeegfedvueehueelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepfhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrghdpnhgspghr
    tghpthhtohepuddtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrnhgurhgvrg
    hssehgrghishhlvghrrdgtohhmpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhf
    thdrnhgvthdprhgtphhtthhopehgvggvrhhtsehlihhnuhigqdhmieekkhdrohhrghdprh
    gtphhtthhopegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhm
    pdhrtghpthhtohepuggrnhhivghlsedtgidtfhdrtghomhdprhgtphhtthhopehprghvoh
    hnvgesrhgvthhrohguvghvrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghl
    sehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmheikehkse
    hlihhsthhsrdhlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehlihhnuhigqdhr
    thgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:S7IqZ083-Wf7QlnJCbsnsJv5VrsuQzmre5PSEy63TO7bPd6REsbEmA>
    <xmx:S7IqZ_tK5ecQLbYA_6wW7GDQDJj2F8meQN0CrfUICLHqti6e-pqfdg>
    <xmx:S7IqZzELSQhpnyyctPwv6qplXo69jp5u11Fc_Lyy4EIAleZkx-x4MQ>
    <xmx:S7IqZ2Nb8WixViU23CSkkDpeE474WbvsYL6-U6fAA5hD_l1_XvA97Q>
    <xmx:TLIqZ9LJliW3WNm4cwVxgpSBydDhC2xAU9pQDqApNIeLjJ2cTHRpmH36>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 5 Nov 2024 19:03:22 -0500 (EST)
Date: Wed, 6 Nov 2024 11:03:33 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Andreas Larsson <andreas@gaisler.com>, 
    "David S. Miller" <davem@davemloft.net>
cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
    Alexandre Belloni <alexandre.belloni@bootlin.com>, 
    Daniel Palmer <daniel@0x0f.com>, Michael Pavone <pavone@retrodev.com>, 
    linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
    linux-rtc@vger.kernel.org, sparclinux@vger.kernel.org
Subject: Re: [PATCH v3 0/2] MVME: Adopt standard RTC driver
In-Reply-To: <cover.1728377511.git.fthain@linux-m68k.org>
Message-ID: <c1e24cba-69f9-796e-51d7-5c04ad96b75e@linux-m68k.org>
References: <cover.1728377511.git.fthain@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


Hi sparc maintainers

These two patches have now been reviewed by Geert. If you would be so kind 
as to review the sparc changes, I will ask the RTC maintainer to consider 
merging this series.

Regards
Finn

On Tue, 8 Oct 2024, Finn Thain wrote:

> This series removes some duplicated RTC driver code.
> First rtc-m48t59 is tweaked to bring it into equivalence with the RTC
> drivers in arch/m68k/mvme*. Then platform devices are added for the
> former driver and the latter drivers are removed.
> 
> ---
> Changed since v1:
>  - Instead of adding ifdefs to the portable driver, store the year offset
>    in struct m48t59_plat_data.
> 
> Changed since v2:
>  - Use an int for the year offset in struct m48t59_plat_data.
> 
> 
> Finn Thain (2):
>   rtc: m48t59: Use platform_data struct for year offset value
>   m68k: mvme147, mvme16x: Adopt rtc-m48t59 platform driver
> 
>  arch/m68k/configs/multi_defconfig   |   1 +
>  arch/m68k/configs/mvme147_defconfig |   1 +
>  arch/m68k/configs/mvme16x_defconfig |   1 +
>  arch/m68k/include/asm/mvme147hw.h   |  19 +---
>  arch/m68k/include/asm/mvme16xhw.h   |  18 +--
>  arch/m68k/mvme147/config.c          |  55 ++++------
>  arch/m68k/mvme16x/Makefile          |   2 +-
>  arch/m68k/mvme16x/config.c          |  57 ++++------
>  arch/m68k/mvme16x/rtc.c             | 165 ----------------------------
>  arch/sparc/kernel/time_32.c         |   1 +
>  arch/sparc/kernel/time_64.c         |   1 +
>  drivers/rtc/rtc-m48t59.c            |  26 +----
>  include/linux/rtc/m48t59.h          |   3 +
>  13 files changed, 63 insertions(+), 287 deletions(-)
>  delete mode 100644 arch/m68k/mvme16x/rtc.c
> 
> 

