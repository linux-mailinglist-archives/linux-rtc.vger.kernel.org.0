Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2BB441B146
	for <lists+linux-rtc@lfdr.de>; Tue, 28 Sep 2021 15:55:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240948AbhI1N4q (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 28 Sep 2021 09:56:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240939AbhI1N4p (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 28 Sep 2021 09:56:45 -0400
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE028C06161C;
        Tue, 28 Sep 2021 06:55:05 -0700 (PDT)
Received: by mail-vs1-xe30.google.com with SMTP id 66so18164908vsd.11;
        Tue, 28 Sep 2021 06:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+jPaJ+GABZOzjw+GELhhDpnTZhDfIagt6CBewHxm7U0=;
        b=LXhLEnd33jicskS6UcaZAb41CqL52E5Seq7OWWW2xxTpEjmgRRp7qzqfZzyh0FkToN
         /6lOV24Z4KKQvP4KTes0E0nE9dudMLxKTRK6Xai3kopcp2OuUsAnxU+8YR8+tzn1Yono
         JpkTh6pue7MALDZCKSE6UmBbn6HNbKTGoiB7hqdI4bzIcnXfTCOYqAK+6drqn6HeAd6D
         exFQRnme/gawe1cGmfj80og7FQiG++j/ynBcfzf2iVE/W91FKp+rXhGAw616sUgzkdVx
         auxWwiZTsBo4MIRR3ybAXgdWek2qknW3/7RY2kExwU5SmL/RkvX40NpF973OzH1LnXa8
         YZ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+jPaJ+GABZOzjw+GELhhDpnTZhDfIagt6CBewHxm7U0=;
        b=3LUtNJsPiWtgSe02pa6SaLdP7Aq3S/OSN/jb6A+cXeAdRiuJz+tOGxDrWSBUaZevkh
         HvrQEHhYSJCqy1iINj6tXVnKngQi5nUv6OVUUr7jRjQzHCZke0Dspe20d4XO0Oxs3s57
         MnR9+GUrkqt1HBSrZ2Qh4VMuOb1+oe2e9nSouR6+a10nJfn2qCdoOtOY9tzzV6TAXFT4
         QAX6htpq/oi++5C8lrX/RAiW8pofR9l0hS1Pp6ER23gsSBT9xZ32hjePNvjWb5ZO5QDQ
         +Or+4wM4DfMnz+AxdYDV/HT3bboib8QB4PzXC4LLFrbGLo12HBSKrokwRJrOiDQIb4R4
         Ii7w==
X-Gm-Message-State: AOAM533CYr44caIbehngY3hXeQx/SMI9mc0Y3UGzw6KZtjL5/KZWY4sL
        8ugYBrBx5Ago+BNY9w/qg85dKCi9Szh1YXOE2FSRA11BhAE=
X-Google-Smtp-Source: ABdhPJzLh7Jb/wnh4RKZv0UR3iSofWX37Wa9vOXlE7qYmrFFAHxWv80ex6A3BathdkpubK9DhMaInQCPrECJuGRjLVw=
X-Received: by 2002:a67:7247:: with SMTP id n68mr5305042vsc.56.1632837304987;
 Tue, 28 Sep 2021 06:55:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210928123906.988813-1-colin.king@canonical.com> <CAFr9PXnMXPmuaUnfr-VwaZDX1hY8ZDtp1+UxOau6DKpUP9FdzQ@mail.gmail.com>
In-Reply-To: <CAFr9PXnMXPmuaUnfr-VwaZDX1hY8ZDtp1+UxOau6DKpUP9FdzQ@mail.gmail.com>
From:   Romain Perier <romain.perier@gmail.com>
Date:   Tue, 28 Sep 2021 15:54:53 +0200
Message-ID: <CABgxDoLPTcRbZZgAdJ9+=9OG+a=F59x9SQ9HvQkVvGmkDjO6-A@mail.gmail.com>
Subject: Re: [PATCH][next] rtc: msc313: Fix unintentional sign extension issue
 on left shift of a u16
To:     Daniel Palmer <daniel@0x0f.com>
Cc:     Colin King <colin.king@canonical.com>,
        Daniel Palmer <daniel@thingy.jp>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-rtc@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

Le mar. 28 sept. 2021 =C3=A0 15:31, Daniel Palmer <daniel@0x0f.com> a =C3=
=A9crit :
>
> Hi Colin,
>
> On Tue, 28 Sept 2021 at 21:39, Colin King <colin.king@canonical.com> wrot=
e:
> >Shifting the u16 value returned by readw by 16 bits to the left
> >will be promoted to a 32 bit signed int and then sign-extended
> >to an unsigned long. If the top bit of the readw is set then
> >the shifted value will be sign extended and the top 32 bits of
> >the result will be set.

Good catch !

>
> Ah,.. C is fun in all the wrong places. :)
> These chips are full of 32bit registers that are split into two 16
> registers 4 bytes apart when seen from the ARM CPU so we probably have
> this same mistake in a few other places.
>
> A similar pattern is used a bit later on in the same file to read the cou=
nter:
>
> seconds =3D readw(priv->rtc_base + REG_RTC_CNT_VAL_L)
> | (readw(priv->rtc_base + REG_RTC_CNT_VAL_H) << 16);
>
> I guess it works at the moment because the top bit won't be set until 203=
8.

The crazy stuff being, I ran rtctest from selftests and rtc-range (1)
that tests a variety
of dates including 2038 and 2106 for example. Both tests passed :) (probabl=
y
because *this case* specifically did not happen while running the test)

1. https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/rtc-tools.git/t=
ree/rtc-range.c

Thanks,
Regards,
Romain
