Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E17F33AE44E
	for <lists+linux-rtc@lfdr.de>; Mon, 21 Jun 2021 09:42:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230186AbhFUHoX (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 21 Jun 2021 03:44:23 -0400
Received: from mail-vk1-f169.google.com ([209.85.221.169]:42602 "EHLO
        mail-vk1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229937AbhFUHoV (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 21 Jun 2021 03:44:21 -0400
Received: by mail-vk1-f169.google.com with SMTP id y30so2647659vke.9;
        Mon, 21 Jun 2021 00:41:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3+Xam//Oc2mo0N99zqv9MSYzVFrmCg9uwZC0FSTjR2E=;
        b=BK7Z8nxWXkInW0IcXMVJiUiZdW9fORp1v2qpwazKGnigyJ+RlrOUXwOT2T8hiz7c60
         my++PsCuIR/0X1ahk4jGObjt8q9SXnen7L3iH8pWbnTuJsqi2rmA0ZeisVo7GKNbnGYG
         HJeH13kP+IxUY4Xu+mgy07jBcJjx+i8OUTqzfxtoyKn/bLg/TCSlCj/z8vs4Mk3avJDl
         KbAIBr+wQ4FfxkJ+yngt7aQse3y27E771Q1oQQsaqRjNe31pvuIEpBwRfjGTpkGTrGT1
         AZCR62XZUDsvLCEJj6NwcQlW/fw0DryfV3u3I5GnITHlLOJwUurglEmzO+ftrtPEpxKT
         I5+w==
X-Gm-Message-State: AOAM533LDZFtvIRho/ZrR847GnHRtIG/gynKBMBfriop+3O+e3r/lA68
        5S8eD2ACEjRKHcDpf+XMueJ+vPKiYqLKXjEz7PU=
X-Google-Smtp-Source: ABdhPJwUGiA4tn0aGijm5qAD0hIQnS2zruY7gbs5BsxC4o+uPMK5G+PUTK+B6Ys6LtrPsmax4PMha9TzjKL5RC9IN4A=
X-Received: by 2002:a1f:1a41:: with SMTP id a62mr13252035vka.5.1624261282759;
 Mon, 21 Jun 2021 00:41:22 -0700 (PDT)
MIME-Version: 1.0
References: <42d9c71b4ee1f120e0cdcf6b266547d29d1fb9a4.1623851377.git.geert+renesas@glider.be>
 <20210620205546.GA17070@amd>
In-Reply-To: <20210620205546.GA17070@amd>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 21 Jun 2021 09:41:11 +0200
Message-ID: <CAMuHMdXwjpwe_mTXtEC7rKkCty7qmS8pjUAWwpY3pE-BPV+C_g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: rtc: ti,bq32k: Convert to json-schema
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>, linux-rtc@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Pavel,

On Sun, Jun 20, 2021 at 10:55 PM Pavel Machek <pavel@ucw.cz> wrote:
> > Convert the TI BQ32000 I2C Serial Real-Time Clock Device Tree binding
> > documentation to json-schema.
> >
> > Document missing properties.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> > index 0000000000000000..392bd71bd1bee25c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/rtc/ti,bq32000.yaml
> > @@ -0,0 +1,49 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/rtc/ti,bq32000.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: TI BQ32000 I2C Serial Real-Time Clock
> > +
> > +maintainers:
> > +  - Pavel Machek <pavel@ucw.cz>
>
> I'm not sure why I'm listed here, but I probably should not be. I
> don't have access to that hardware any more.

You wrote the bindings, and are the only person who ever modified
the file before.
I see Alexandre has already assumed maintainership in the mean time.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
