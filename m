Return-Path: <linux-rtc+bounces-84-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AD07C009B
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Oct 2023 17:46:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F92C281810
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Oct 2023 15:46:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C6D727468;
	Tue, 10 Oct 2023 15:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D2D27451
	for <linux-rtc@vger.kernel.org>; Tue, 10 Oct 2023 15:46:02 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45A7DAC;
	Tue, 10 Oct 2023 08:46:00 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-59f4f80d084so70026857b3.1;
        Tue, 10 Oct 2023 08:46:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696952759; x=1697557559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/BrSS2BkzC0XIs/6Y8FHD371dmDXGrmpx/NKcppkKyM=;
        b=hJQCFbmzIUB2TymHhLKJFgDulUYL+LIDer4/85QrYydY9bIBZ7Q1SB5RrpIR+fiTNq
         674PR3xRVsqrwDFCpACIKWfIgTldBDAMDqNIRb5TXJR1n8+zf/bqZtufdLEKdF/Bl+IU
         fXFB3IhjOi1syX89oTDAmK9yUnKmz90S9HeCVF3xkZNQ3RV6SUPoHTuaLJiaV5eN2J+B
         sXLXC5wV8z1UXZGuvSFs7FBaAf10JcZtYDVNYEyP/dAFCahaTEcW9/nucB3Ezoz0r5i5
         vy6pMNN/RVWOcSeQuoV4ahFJQIv/z6piW6p/tl9BPzElqUgBigKhNijjU9D2Vz7/fCxc
         AsfQ==
X-Gm-Message-State: AOJu0YwuA+BsbIlfUbQslKj4i540lZF3uxTVbzt78xEDFO+OE31i49B+
	tM5x/TExnT5soUMDeuk/IDcvq3BAvherfw==
X-Google-Smtp-Source: AGHT+IFgWODP/RB9wHd1yRRczE16pgDaG2QhveMQUY4lcAuIsgPVvVU+LKi6Zm27A4LqEZbLbbipTA==
X-Received: by 2002:a0d:c787:0:b0:59f:7fb9:621a with SMTP id j129-20020a0dc787000000b0059f7fb9621amr18863206ywd.22.1696952759182;
        Tue, 10 Oct 2023 08:45:59 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id m13-20020a819e0d000000b005a42740fcd4sm4445857ywj.94.2023.10.10.08.45.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Oct 2023 08:45:58 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-d9a3d737d66so1682147276.2;
        Tue, 10 Oct 2023 08:45:58 -0700 (PDT)
X-Received: by 2002:a25:f44:0:b0:d91:b8c7:b423 with SMTP id
 65-20020a250f44000000b00d91b8c7b423mr13449016ybp.65.1696952758581; Tue, 10
 Oct 2023 08:45:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230922081208.26334-1-biju.das.jz@bp.renesas.com>
 <87il7fq1al.ffs@tglx> <TYCPR01MB112697A5D4B57101CDE27C88D86CEA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <87fs2jpznr.ffs@tglx> <TYCPR01MB11269C6BF3934F9AAC44F855186CEA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <87bkd7pic3.ffs@tglx> <TYCPR01MB11269FF2DBFDC96B9C12D2E5E86CDA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <87o7h6o6d1.ffs@tglx>
In-Reply-To: <87o7h6o6d1.ffs@tglx>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Oct 2023 17:45:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVJnqkF7xmjfOyoxE_Lq=AO85CDD85qu3O+xcSr-3BLTQ@mail.gmail.com>
Message-ID: <CAMuHMdVJnqkF7xmjfOyoxE_Lq=AO85CDD85qu3O+xcSr-3BLTQ@mail.gmail.com>
Subject: Re: [PATCH v2] alarmtimer: Fix rebind failure
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Alessandro Zummo <a.zummo@towertech.it>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, John Stultz <jstultz@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, Douglas Anderson <dianders@chromium.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Biju Das <biju.das.au@gmail.com>, 
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hi Thomas,

On Tue, Oct 10, 2023 at 5:16=E2=80=AFPM Thomas Gleixner <tglx@linutronix.de=
> wrote:
> On Tue, Oct 10 2023 at 06:18, Biju Das wrote:
> > RTC driver is defined as a module, so I was testing
> > remove/unbind followed by install/bind on RTC driver to check
> > any resource leakage and found that device is not working properly.
> >
> > As you mentioned above, we should not remove RTC driver. So I would
> > like to drop this patch.
> >
> > Is there any place we can document this to avoid another person doing
> > same mistake?
>
> The point is that the removal should not happen in the first place.
>
> Though it seems that even a held refcount on the module is not
> preventing that, which is bad to begin with.

Indeed.  I had expected to find at least one RTC driver for a device
on a hot-pluggable bus like USB, but apparently we have none of these
(yet).  So currently RTC device removal can only be triggered by a
manual sysfs unbind or delete_device.

> That aside I'm not saying that supporting removal is completely
> impossible. The charger driver can probably be fixed, but as this is a
> user space visible change this needs a lot of thoughts and proper
> analysis why such a change would be correct under all circumstances.

The charger manager seems to be considered a legacy driver.
Devices are only instantiated from the drivers/mfd/88pm860x.c (as used
on Marvell PXA910 DKB boards), or directly from DT (no upstream
users). The DT bindings say:

    Binding for the legacy charger manager driver.
    Please do not use for new products.

The "if (alarmtimer_get_rtcdev()) { ... }" you pointed out in the
probe function  seems to be rather fragile, as it depends on probe
order. And both CHARGER_MANAGER and RTC_DRV_88PM860X can be modular.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

