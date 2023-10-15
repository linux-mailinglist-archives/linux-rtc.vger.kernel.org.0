Return-Path: <linux-rtc+bounces-97-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B68E87C9BB3
	for <lists+linux-rtc@lfdr.de>; Sun, 15 Oct 2023 23:03:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DA169B20BAD
	for <lists+linux-rtc@lfdr.de>; Sun, 15 Oct 2023 21:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DF24125A7;
	Sun, 15 Oct 2023 21:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="c6ARML0a"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640F3F9D7
	for <linux-rtc@vger.kernel.org>; Sun, 15 Oct 2023 21:03:32 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82069C1;
	Sun, 15 Oct 2023 14:03:29 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1A952FF803;
	Sun, 15 Oct 2023 21:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697403807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hTwklEfaOGXzPuu0wgNJt+wg/VaYnTSB84Thn1EX5s8=;
	b=c6ARML0aU00n0wrZPdTw9CDWeohFOYPQmhi+4DNwMBo0mH8fZsf9SVr9pjoDVDiK+mDlA4
	CMrwzAsHLxW98ky92OTPDU1SucqTHZaFtPBej18fkFFB9faeCjuHZy6PLqRQYmO25MMJDI
	LncEL6moEG1aaW2PIWNqFUsrK/FTL+5OWj71L098UT83w+zkiB37qcsbZigG2X2ww4GIfU
	D6wcWohDTdJRjAFhwF6oTCJiGIgIp689PY4/6JgNBFKQETlcvJDgZqcZ3B8nho5ZpHSMrC
	zWvNcinfG8u1br7xH9LgTxCfpgeLWAjYpNBYPP9zcQjGJ8AZTeElnPaV9WjeVw==
Date: Sun, 15 Oct 2023 23:03:26 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alessandro Zummo <a.zummo@towertech.it>,
	Maxim Korotkov <korotkov.maxim.s@gmail.com>
Cc: Shanker Donthineni <sdonthineni@nvidia.com>, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Subject: Re: [PATCH] rtc: efi: fixed typo in efi_procfs()
Message-ID: <169740375019.169509.9586187198023577263.b4-ty@bootlin.com>
References: <20231006090444.306729-1-korotkov.maxim.s@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231006090444.306729-1-korotkov.maxim.s@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net


On Fri, 06 Oct 2023 12:04:44 +0300, Maxim Korotkov wrote:
> After the first check of the value of the "eft" variable
> it does not change, it is obvious that a copy-paste
> error was made here and the value of variable "alm"
> should be checked here.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> [...]

I changed the fixes tag to:
Fixes: 501385f2a783 ("rtc: efi: add efi_procfs in efi_rtc_ops")

Applied, thanks!

[1/1] rtc: efi: fixed typo in efi_procfs()
      commit: f5f4c982f7c8a8cffb2663078a40ecd7d82b534d

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

