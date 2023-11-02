Return-Path: <linux-rtc+bounces-186-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 352A17DF7E8
	for <lists+linux-rtc@lfdr.de>; Thu,  2 Nov 2023 17:46:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6326A1C2034E
	for <lists+linux-rtc@lfdr.de>; Thu,  2 Nov 2023 16:46:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCC62125A6;
	Thu,  2 Nov 2023 16:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dmYVWSll"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996F36FAE
	for <linux-rtc@vger.kernel.org>; Thu,  2 Nov 2023 16:46:45 +0000 (UTC)
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50E8A123;
	Thu,  2 Nov 2023 09:46:44 -0700 (PDT)
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-581fb6f53fcso602645eaf.2;
        Thu, 02 Nov 2023 09:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698943603; x=1699548403; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZeWMjKX0A15+aNxn4tBa5TwI+egpnMwKMRDogqWOO5M=;
        b=dmYVWSlloEGHEDidIB5QPCqutn/vVoByMtXOcMFwL0i3Uv9R2pvZbnZEwUW1ihNva8
         JOZItTE2FFgunPBCTbMUjFUsgM+nHXj9vdNGT/6ypcUSynHnmXfNwVQ1CPrQvWO5w+3P
         mMz9zKMXSyFRzfH5MjrmGNvuoHNZg+OLLVQeu1cZ2j7xSYLOpghH1ODJGQzMOOrAkQ6M
         8KHncvrXoaM7ESQlvQFLvRGEtWclzvJzbrSz7mOiMQrFQ4LcJEbwTNzX/y5AtVvOyEQH
         KufUwnBWqzZjL/4CFQzMs5HHEVfCRlCSaTrV7HFKzntTUaExouSej1eEVioLJQoxXEbS
         S7SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698943603; x=1699548403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZeWMjKX0A15+aNxn4tBa5TwI+egpnMwKMRDogqWOO5M=;
        b=TeSYuGQ+dAAPnK4s9ica6RQCIAYUwqdRLYBc15Q3zv7LEAKBJKgAbPWPWGOvyhHAPm
         +MZwFNOmOjB/PEoEbQvLqnK/vg3BVmPva5xQA/McoIOLUMFzPkmIx/xf0gCSG68E3UOZ
         iPTaTEpfiu14FpHH8dn+JrqFEFAbbRo4GgTlnbUc1YTYO2lNNjrFez+84y5RRGdfLtws
         DDAgQ7xAdYCA8hiLajuKjneT+6H+Bo0A+dHHedtzFEsZYN3X9JS6ZJiSP/A3H+xGto2P
         HCwRb77TYvp++WCyD1Y1/hzm4WXTmlMTC5SyiaTBSXq94//A0k/EQML10sicc6Os8rZG
         sR2Q==
X-Gm-Message-State: AOJu0YyP70LZKywI5oJ4r6T/iJwL/7I5d1PKzwGWM1Drof2hWrZekq0L
	svrE1J7eRJJrDyeTV0A2saKzUAhA6z604C3DI8pPcSodgNU=
X-Google-Smtp-Source: AGHT+IGi+h9nfKMxWfkNHYa63s5ikFipizpFdekV2CzzhNGv3uYjimDjANsV7PGySPXJIYMaQ1MvmaevA82D+GZEbLc=
X-Received: by 2002:a05:6358:cc26:b0:168:eaf6:da1d with SMTP id
 gx38-20020a056358cc2600b00168eaf6da1dmr15718873rwb.30.1698943603529; Thu, 02
 Nov 2023 09:46:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231102132616.1130960-1-eblanc@baylibre.com> <CAHp75VdvR0H7XVLWGqdZqSgoHprUUPQHGiyWEEaHjTgEbeinqQ@mail.gmail.com>
 <CWOGMAUT9MKY.2IBKELIOR1CF7@burritosblues>
In-Reply-To: <CWOGMAUT9MKY.2IBKELIOR1CF7@burritosblues>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 2 Nov 2023 18:46:05 +0200
Message-ID: <CAHp75VdV5A+WpWj2eY9o_2wwPB7GTi6Eig7YyV8urdv1P3utgQ@mail.gmail.com>
Subject: Re: [PATCH v8] rtc: tps6594: Add driver for TPS6594 RTC
To: Esteban Blanc <eblanc@baylibre.com>
Cc: a.zummo@towertech.it, alexandre.belloni@bootlin.com, 
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, jpanis@baylibre.com, 
	jneanne@baylibre.com, u-kumar1@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 2, 2023 at 6:17=E2=80=AFPM Esteban Blanc <eblanc@baylibre.com> =
wrote:
> On Thu Nov 2, 2023 at 5:00 PM CET, Andy Shevchenko wrote:
> > On Thu, Nov 2, 2023 at 3:26=E2=80=AFPM Esteban Blanc <eblanc@baylibre.c=
om> wrote:
> >
> > > Notes:
> > >     This patch was picked from a series since there is no dependency =
between
> > >     the two patches.
> >
> > Not sure if RTC maintainer uses the b4 tool, but as I said in previous
> > email for pinctrl change, there is no need to resend. b4 has an
> > ability to select patches from the series to be applied.
>
> Oh that's good to know, I was not aware of that.
> I resent it because there was some minor nits that I fixed on both
> patches.

Ah, that was not reflected in the changelog...

--=20
With Best Regards,
Andy Shevchenko

