Return-Path: <linux-rtc+bounces-89-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAAE7C4E48
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Oct 2023 11:12:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5740328207D
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Oct 2023 09:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 356DE1A72B;
	Wed, 11 Oct 2023 09:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="l5sh4dOz";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="QxJnYCZj"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF651A717
	for <linux-rtc@vger.kernel.org>; Wed, 11 Oct 2023 09:12:28 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A12E94;
	Wed, 11 Oct 2023 02:12:27 -0700 (PDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1697015545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8mHTnG4MfEd2WInpkSaCyoIk5Nbax8kxNBig7AwLSEU=;
	b=l5sh4dOzDZ2X5HB7Xi84ttICGEA/Gzkkha41sxLmx8M1qkMsMpYCG0Xnyt/vGoVR0Dbdjy
	ucI9k/OtsU/Er7zqcw00spV0cvJPo8qfx2tD3YPpBhY0FsWc5l8QHCRzkkJmx1fffCitpK
	p3KWoVHzp++qoCf8dlfDVFuEtfML3i0rNKwNitl84UoRHNZN9AAmKlVTliBtrwQaQZlHcc
	+UrlmjwOIV/vAWWxlbAC1SBwNYR5Gymwi67+BIgiBXfjMjMllp22y0hZga4sAYbDkS36Fo
	sJnENvRXJ20gGfmlw9LvJsEEA5EcKGm5czz2PAlXomLE/TJQXC7jLHM8Xrnp8w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1697015545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8mHTnG4MfEd2WInpkSaCyoIk5Nbax8kxNBig7AwLSEU=;
	b=QxJnYCZjXLEtyBI07eDRRe9WPqv1ZDHIwowp2BRGFJbN8R4Ajg6bj5fwV7Th8ozoNOCQOJ
	iYr4BRUAc4t+t+Cw==
To: Biju Das <biju.das.jz@bp.renesas.com>, Geert Uytterhoeven
 <geert@linux-m68k.org>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, John Stultz <jstultz@google.com>, Stephen
 Boyd <sboyd@kernel.org>, Douglas Anderson <dianders@chromium.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Biju Das <biju.das.au@gmail.com>,
 "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: RE: [PATCH v2] alarmtimer: Fix rebind failure
In-Reply-To: <TYCPR01MB112693065867ACA9C42370B9F86CCA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20230922081208.26334-1-biju.das.jz@bp.renesas.com>
 <87il7fq1al.ffs@tglx>
 <TYCPR01MB112697A5D4B57101CDE27C88D86CEA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <87fs2jpznr.ffs@tglx>
 <TYCPR01MB11269C6BF3934F9AAC44F855186CEA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <87bkd7pic3.ffs@tglx>
 <TYCPR01MB11269FF2DBFDC96B9C12D2E5E86CDA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <87o7h6o6d1.ffs@tglx>
 <CAMuHMdVJnqkF7xmjfOyoxE_Lq=AO85CDD85qu3O+xcSr-3BLTQ@mail.gmail.com>
 <TYCPR01MB112693065867ACA9C42370B9F86CCA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
Date: Wed, 11 Oct 2023 11:12:25 +0200
Message-ID: <87r0m1ldza.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Wed, Oct 11 2023 at 06:58, Biju Das wrote:
>> On Tue, Oct 10, 2023 at 5:16=E2=80=AFPM Thomas Gleixner <tglx@linutronix=
.de> wrote:
>>=20
>> The "if (alarmtimer_get_rtcdev()) { ... }" you pointed out in the probe
>> function  seems to be rather fragile, as it depends on probe order. And
>> both CHARGER_MANAGER and RTC_DRV_88PM860X can be modular.
>
> Does it mean that current patch is fine?  On normal scenario, no one
> will remove RTC device, so nothing to worry about battery charger. On
> exceptional cases if anyone wants to remove RTC driver, this patch
> will help(for eg: checking resource leak remove/unbind followed by
> modprobe/bind).

Did you actually read what I wrote?

Allowing removal of a registered RTC alarm device is a user space
visible change as it violates the assumption that an armed alarm timer
is actually functional.

So unless you provide a proper analysis why this does not matter, this
is going nowhere.

Thanks,

        tglx

