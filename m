Return-Path: <linux-rtc+bounces-6301-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOgQM/wC1mlsAAgAu9opvQ
	(envelope-from <linux-rtc+bounces-6301-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 08 Apr 2026 09:25:48 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 448F23B8143
	for <lists+linux-rtc@lfdr.de>; Wed, 08 Apr 2026 09:25:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 92A59301945B
	for <lists+linux-rtc@lfdr.de>; Wed,  8 Apr 2026 07:25:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56799381AF8;
	Wed,  8 Apr 2026 07:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZKa8rgOf"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F24C3806D2
	for <linux-rtc@vger.kernel.org>; Wed,  8 Apr 2026 07:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775633138; cv=none; b=CTa057UjvX3JIJyWAksQfZPHVp9MFDzCTsR1N1Tzc2puPc2bgcVVeR4jjO4APg0nXgwqrmI32UAYE4N4BIgW9k2YYv5Aputbn6TwfYYkKxBMf1JL4Sgr5RyQCuX784OiAoAx/Kyz8BoSyqqMP/Ne964GeNoVqnXJKNKLYbuAc+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775633138; c=relaxed/simple;
	bh=k0MM4f61dReWkZKsY2vkZQ3/711YvRGa40vr8D8EZaA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mw0De0xemOYCmSN4u3G4Ko70I1i4prhJ7+GSPkT5ttkWYFrJal50DxvmNTTA3hZ/X7Ik36oVvkA+DR0o0WvuGd4u9kWPx8O1QQhTQHcX69ZQEsR3G6/tkISXVyCVcK9w+xYENeDjxZrWvwlH5n0pBHBoWIh/1RAlnTxCz59gQvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZKa8rgOf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00BD9C2BCF6
	for <linux-rtc@vger.kernel.org>; Wed,  8 Apr 2026 07:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775633138;
	bh=k0MM4f61dReWkZKsY2vkZQ3/711YvRGa40vr8D8EZaA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZKa8rgOfv34YUkHQ7dpn7k/xtzKSAkH/HrQK+1h+qkINwUjEnAfdi/1sa5hZOdS/y
	 st9K9ehCzwYy2+1OvpxiUO0hPo/DxVfxCitqGXh+/Z1iFgnFoQ5UF8uRvlP30UEvPl
	 H+/nyH9MK1ZnBMyw9Aujj6wFdjVrQkh9psGVG2+DQgd5WVRAAW6R70HokvEqSgnkv3
	 XlkPmLV06LBWvcC78iN+obk6YQenfLVG2B1MA+J/tTTe5u66eMMtLRcn3Req8+JQf8
	 8xYeo00VWKvKHW6eqd3r4MNRb/zZ21vYgss2YY0cUSbKDL704r1iIQ+jiwTbVAxTsN
	 aALV49o25qhQw==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a3d1561e38so3077279e87.0
        for <linux-rtc@vger.kernel.org>; Wed, 08 Apr 2026 00:25:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU4ok+D0fda03fLR10EIQIbbX24r+GdLblao/C8C7qFSzzvP1JlziMmVyL4Ha/aPhpF3x4Z8Z/onqs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXxUo6AuqlAKEET145B8amzXhnLEoNHiM4UZYPpBaoluWoGoNB
	8JQ0/f9cVBgWHCdDVtingzncfvO8Gj5oAP2K03++Aua/cmXR1wF27QUQPDuBKv//RZc72mlwEOH
	gCBBdAgLPgdXzPQVhwHHs6R2+JdXYPWYVkyXkCVOQKA==
X-Received: by 2002:ac2:44d7:0:b0:5a2:a36f:3ef4 with SMTP id
 2adb3069b0e04-5a337584d52mr4484821e87.31.1775633136523; Wed, 08 Apr 2026
 00:25:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260408053037.1867092-1-a0282524688@gmail.com> <20260408053037.1867092-2-a0282524688@gmail.com>
In-Reply-To: <20260408053037.1867092-2-a0282524688@gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 8 Apr 2026 09:25:24 +0200
X-Gmail-Original-Message-ID: <CAMRc=MeJL_po8HuBa4btVowR-e0i2FyzbDgNVo2u54iPKyuvWw@mail.gmail.com>
X-Gm-Features: AQROBzDYlaw0h6c8CMDzh6teyUf20He-hNaCxS9JyLVdz8XM05uU1MsXkarTiB4
Message-ID: <CAMRc=MeJL_po8HuBa4btVowR-e0i2FyzbDgNVo2u54iPKyuvWw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mfd: nct6694: Switch to devm_mfd_add_devices() and
 drop IDA
To: a0282524688@gmail.com
Cc: tmyu0@nuvoton.com, linusw@kernel.org, linux@roeck-us.net, 
	andi.shyti@kernel.org, lee@kernel.org, mkl@pengutronix.de, mailhol@kernel.org, 
	alexandre.belloni@bootlin.com, wim@linux-watchdog.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6301-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-rtc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 448F23B8143
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 8, 2026 at 7:31=E2=80=AFAM <a0282524688@gmail.com> wrote:
>
> From: Ming Yu <a0282524688@gmail.com>
>
> Currently, the nct6694 core driver uses mfd_add_hotplug_devices()
> and an IDA to manage subdevice IDs.
>
> Switch the core implementation to use the managed
> devm_mfd_add_devices() API, which simplifies the error handling and
> device lifecycle management. Concurrently, drop the custom IDA
> implementation and transition to using pdev->id.
>
> Signed-off-by: Ming Yu <a0282524688@gmail.com>
> ---

This does result in a nice code shrink but I'd split this commit into
two: one switching to using MFD_CELL_BASIC() with hard-coded devices
IDs and one completing the transition to devres.

Bart

