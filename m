Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B436AA1C4C
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Aug 2019 16:04:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727066AbfH2OEx (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 29 Aug 2019 10:04:53 -0400
Received: from mail-ed1-f49.google.com ([209.85.208.49]:43972 "EHLO
        mail-ed1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727063AbfH2OEw (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 29 Aug 2019 10:04:52 -0400
Received: by mail-ed1-f49.google.com with SMTP id h13so4185198edq.10;
        Thu, 29 Aug 2019 07:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5XrYpbZokJ0uFDtRrg4QMHh8QMmoNf0yygZI19dOceA=;
        b=ATLRDHWe3jUWrX5jam+pWx349PMbQEJL2dVu+BdsFcYVO4VEdlv6wayE3oNcHZ8/7K
         CxoKPuyCxWUtmlQwTC7XAsQz+4zrH/sDqeiR3xJ9coRomyOJP5ng9m1CtZgbdVm6RkWk
         xMexcFibvPGyONCsKwAFfhEr2GgBkKLTl5ylI8IFWOtoCclIiDBWV/gS4qPRDIFE3k0Q
         veYEi32Zf4DDlPWuw5wTDRjxwFY2wRVKYkuLUDIS8XEQIFbf+Z7qsIw3p5wYUOechUvl
         tttaMO89K8Vrb8HEWfIRSzAnz1S9yjLarTGKOMqZpJHH8GVgzZnYO/q3ts052VUqBrM+
         U/ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5XrYpbZokJ0uFDtRrg4QMHh8QMmoNf0yygZI19dOceA=;
        b=IIjCH7Lt1ui+5KeimvJhVxBgkD2ME5UNNbDuGsj6PNlzpd+2dCRGdrkJP+L5kCcEBH
         CBYIHyhbEgUKQ4gojIA1JiKwxAEsBQz1pfCbNsGQQrpd7ayps+8mXYOFBJJ6Zo0Gdx6Q
         dDjwRypQ9RTO9Goy/K11PffhpkGkpOJnGAt1sht4Coyv6sLOPao4VUWDH+beIFlp3ZgR
         yJ/3bFplFohExyCKC8vJN89j4nR2GCQnDWlI0551+re3uUdPLBecj2ebkDRXwBwj/UwC
         gtORAZ2WhKnZncbZ5Ilp1c44JH2G50qmT99zGc4iV6KfXV7jv2woTdPMP9lw5P+NYDay
         RE2g==
X-Gm-Message-State: APjAAAVQY06O/9gYK1w7IvgubbqFrVQiqvxRQpPEHWqnTByqGhaCFoO7
        uGMgior8WVPclN7W3l2MfwLqKOuXaFwb4z0pkuI=
X-Google-Smtp-Source: APXvYqzh64P93+HzWnZXGWHngmQqqqEecdRf/S2FlEbcebA+hFxcs869D+rDpSAc9shQvzVrqhLajNWsRk2+3jjVqmY=
X-Received: by 2002:a17:906:e294:: with SMTP id gg20mr8059700ejb.76.1567087490938;
 Thu, 29 Aug 2019 07:04:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190823124553.19364-1-yuehaibing@huawei.com> <20190823140513.GB9844@piout.net>
 <36720fae-ef20-61d4-1d9d-421e7199a0eb@infradead.org>
In-Reply-To: <36720fae-ef20-61d4-1d9d-421e7199a0eb@infradead.org>
From:   Bruno Thomsen <bruno.thomsen@gmail.com>
Date:   Thu, 29 Aug 2019 16:04:34 +0200
Message-ID: <CAH+2xPAGe0H=WRtebd52yE6_Tpjoc+vgTnuJrGHt=K4NutYCNQ@mail.gmail.com>
Subject: Re: [PATCH -next] rtc: pcf2127: Fix build error without CONFIG_WATCHDOG_CORE
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        YueHaibing <yuehaibing@huawei.com>, a.zummo@towertech.it,
        Guenter Roeck <linux@roeck-us.net>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Den ons. 28. aug. 2019 kl. 19.19 skrev Randy Dunlap <rdunlap@infradead.org>:
> > Definitively not, I fixed it that way:
> > +       select WATCHDOG_CORE if WATCHDOG
> >
>
> No, that's not a fix.  The build error still happens with that patch applied.

Hi Randy,

A bugfix has been created[1] and applied to the rtc tree.

Bruno

[1] https://lkml.org/lkml/2019/8/27/1018
