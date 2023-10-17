Return-Path: <linux-rtc+bounces-110-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 725F47CBA91
	for <lists+linux-rtc@lfdr.de>; Tue, 17 Oct 2023 08:09:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0EA97B20FEA
	for <lists+linux-rtc@lfdr.de>; Tue, 17 Oct 2023 06:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E4EDC8DB;
	Tue, 17 Oct 2023 06:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BEizajlB"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEBB1FA2;
	Tue, 17 Oct 2023 06:09:23 +0000 (UTC)
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C385F0;
	Mon, 16 Oct 2023 23:09:22 -0700 (PDT)
Received: by mail-vs1-xe34.google.com with SMTP id ada2fe7eead31-457c82cd87bso1509298137.0;
        Mon, 16 Oct 2023 23:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697522961; x=1698127761; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uPXFduoWlVMCOIs4GLKjZY6fct3g0aANrZC/23nKxxk=;
        b=BEizajlBD9QkaXzVO48GuYv08HYu8TjsNK1qPq6gYKGfd/2C0Zk/l/SfpscJiGbdZx
         Q8qaV9Obt0Kf/JvuPojyJAvguRGVrjAtf4C4bv6Zs16+OX4sL3+zdi1GoDrwg9idA9oF
         4q3yBAkBRunWNL9nLwuxGOZTOfIUIToasyFpbwXjVRKCwulBK91D4M7JbJBF92A3Nf1r
         3r3E2fQ2Klhp0OceqLL1pGayKYgSMbeU6oSnhhuJ8GnX0HrKiUR6R5kRQQqQazcV5MgB
         e7e7OnD8GAuckI7kobAq8MlLWjyqSlq/x/qQ0SEbGq/fx2OGhXAu6ZFJGQQDEbzckPew
         igDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697522961; x=1698127761;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uPXFduoWlVMCOIs4GLKjZY6fct3g0aANrZC/23nKxxk=;
        b=fhQJ5Z8Lx5kEFD0zj278nnuszCuBa60ReMFR0Ku9x0fb47w/N1wQqy/QGoblsWOHE2
         h+Bt6MsGteGyJjIRdQM79DbxuE2fj/oeXLiT2mRxHXgQnlTb4drvnGg5whz2uYBEnkeH
         aawlc1J3Pnqvh0MijLnf9a+D/2DYghiEF07imSzS/DlUsswHt2El1cAEik0xzjrBDxVB
         bMf9TogPJlUUVhje6k/Aps70Ojh0wwxMHctzAvgEzop8McaQZzBe5m1k5ZCsFKc7snGm
         FaG+Hs4lU6VOV9V1dWPf/U7klXOXuR11CYjU+Fg//he4Bw0PmDVH8dFSoUtAweOJbeua
         3RSw==
X-Gm-Message-State: AOJu0YxEwW7EoC4/K5PlS+KR3RL5/DwqrARtRZyUMAPVfzgSFnbE8+so
	KbFM+50uIx1W03vqDTxu9/2iHYXoKgptZAqIGHk=
X-Google-Smtp-Source: AGHT+IH8hL2X8/digTrMWOwMEsoyNF/t/oyd/Gh1bf3U5tfD/mOoYZcD6ZsaC/OjyP8aB22nJYWaztN6jdJAwpGp4OI=
X-Received: by 2002:a67:cd0f:0:b0:457:c445:69f3 with SMTP id
 u15-20020a67cd0f000000b00457c44569f3mr1145850vsl.34.1697522961289; Mon, 16
 Oct 2023 23:09:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230913151606.69494-1-romain.perier@gmail.com> <169746807623.26616.11393539981836060067.b4-ty@bootlin.com>
In-Reply-To: <169746807623.26616.11393539981836060067.b4-ty@bootlin.com>
From: Romain Perier <romain.perier@gmail.com>
Date: Tue, 17 Oct 2023 08:09:10 +0200
Message-ID: <CABgxDoLd7F9kZXsoXtwizPgU6N905XdviEjtoyu6-dARGbyHYw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Add RTC for MStar SSD20xD SoCs
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Daniel Palmer <daniel@0x0f.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Le lun. 16 oct. 2023 =C3=A0 16:55, Alexandre Belloni
<alexandre.belloni@bootlin.com> a =C3=A9crit :
>
>
> On Wed, 13 Sep 2023 17:16:03 +0200, Romain Perier wrote:
> > This patches series adds a new driver for the RTC found in the Mstar
> > SSD202D SoCs. It adds a basic rtc driver, the corresponding devicetree
> > bindings.
> >
> > The rtctest (from selftests) has been passed on this driver, with the
> > following output:
> >
> > [...]
>
> Applied, thanks!

Hi,

Thanks!

>
> [1/3] rtc: Add support for the SSD202D RTC
>       commit: ebf6255868e6141c737cacb8d62b0b347f344877
> [2/3] dt-bindings: rtc: Add Mstar SSD202D RTC
>       commit: cfb67623ce281e045ec11e3eddb1b68b879b53a1
>
> Best regards,

Ah , you also merged dt-bindings, Conor (from dt maintainers) prefers
trivial-rtc.yaml, it makes sense with the current driver.
I planned to make the change for trivial-rtc in v3, so I can adapt the
commit and rename  mstar,ssd202d-rtc.yaml to trivial-rtc.yaml, what do
you think ?

Regards,
Romain



>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

