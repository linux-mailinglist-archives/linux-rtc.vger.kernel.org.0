Return-Path: <linux-rtc+bounces-187-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D817DF7F5
	for <lists+linux-rtc@lfdr.de>; Thu,  2 Nov 2023 17:50:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CA16AB20EAA
	for <lists+linux-rtc@lfdr.de>; Thu,  2 Nov 2023 16:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E6E918E17;
	Thu,  2 Nov 2023 16:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TyHp8fdX"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF2F18AFA
	for <linux-rtc@vger.kernel.org>; Thu,  2 Nov 2023 16:50:45 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11F3512F;
	Thu,  2 Nov 2023 09:50:40 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 00FD2E0005;
	Thu,  2 Nov 2023 16:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698943839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J8sm95/qRZKCVT10ju1IenIB+wV/YCRLeURyKgeuALY=;
	b=TyHp8fdXXVxH/M3PooPSNwZrYF9naziD8LgQYbhwQ+KtEUwO40t9YNTRF4wsR/+Fisc5BJ
	AWnnx5hU+YDX1cpqtFKLYpwpAa1KOmSJW8VveVlQ8bX3kifcPCs1WgvMG9hpHSSbPfxL5N
	ROOkLME1gfO5M4W4yY4wH2qxeuVJUveuC0pMrkZmfhHsbpsigYHUMcsX2n5F09rquhU/zE
	1wfCypVsrrROocMrDp5uz2b8gohYlrggDxJ9SCzOx1jem6m4UhpQ4t9svI+37ozxGTSDky
	nuHDJmBnVMN6jS6yJwagC9E/0azfSo7fuhMjlKHPChtsvwo4MWxI/RyWqhkEVw==
Date: Thu, 2 Nov 2023 17:50:37 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Esteban Blanc <eblanc@baylibre.com>, a.zummo@towertech.it,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	jpanis@baylibre.com, jneanne@baylibre.com, u-kumar1@ti.com
Subject: Re: [PATCH v8] rtc: tps6594: Add driver for TPS6594 RTC
Message-ID: <2023110216503718884fde@mail.local>
References: <20231102132616.1130960-1-eblanc@baylibre.com>
 <CAHp75VdvR0H7XVLWGqdZqSgoHprUUPQHGiyWEEaHjTgEbeinqQ@mail.gmail.com>
 <CWOGMAUT9MKY.2IBKELIOR1CF7@burritosblues>
 <CAHp75VdV5A+WpWj2eY9o_2wwPB7GTi6Eig7YyV8urdv1P3utgQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VdV5A+WpWj2eY9o_2wwPB7GTi6Eig7YyV8urdv1P3utgQ@mail.gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 02/11/2023 18:46:05+0200, Andy Shevchenko wrote:
> On Thu, Nov 2, 2023 at 6:17 PM Esteban Blanc <eblanc@baylibre.com> wrote:
> > On Thu Nov 2, 2023 at 5:00 PM CET, Andy Shevchenko wrote:
> > > On Thu, Nov 2, 2023 at 3:26 PM Esteban Blanc <eblanc@baylibre.com> wrote:
> > >
> > > > Notes:
> > > >     This patch was picked from a series since there is no dependency between
> > > >     the two patches.
> > >
> > > Not sure if RTC maintainer uses the b4 tool, but as I said in previous
> > > email for pinctrl change, there is no need to resend. b4 has an
> > > ability to select patches from the series to be applied.
> >
> > Oh that's good to know, I was not aware of that.
> > I resent it because there was some minor nits that I fixed on both
> > patches.
> 
> Ah, that was not reflected in the changelog...

For the record, I'm using b4 but it was not clear which path the patches
would take.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

