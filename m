Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 411DB2F17C5
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Jan 2021 15:15:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728084AbhAKONc (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 11 Jan 2021 09:13:32 -0500
Received: from mail-ej1-f53.google.com ([209.85.218.53]:33351 "EHLO
        mail-ej1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728002AbhAKON0 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 11 Jan 2021 09:13:26 -0500
Received: by mail-ej1-f53.google.com with SMTP id b9so25057996ejy.0;
        Mon, 11 Jan 2021 06:13:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PQX6JSrchxeSIcws95/Px/lb+7q2acGOY2HvUqsnqJY=;
        b=DV7ms29sQ1I9IKE4G0yDP5Erd3IGfEk6ZlZKDN9nmmkk0l4apg8k5X289CkN3qdcWP
         pZeUhzThCqHqKjoxezGBqS/t6JpEWbyXruKzz9mA1vP98hrWJCuDl/QvrK71hladIidd
         offIuVprUEd10ZWSRMBhlhPOeYavd3NBffrsThSBMsrewDaP3rmzsi+QKQMWX6XCZNXw
         nLtCrs/amyC2xwlmmKl/tkPnLmXXEDvp1hfiIh0BQwdaiGz5bj5EuGZc2fqn62x1Vb4I
         vJbPog8vqtp1z+3tI0DJswVPRkC6C/75jWIMz5ze8Nj0IGAzOjRgRW0MC1r3ReYjVAh1
         4KTA==
X-Gm-Message-State: AOAM532FnicH3V/SwieAAWr2WIyQHko023G0Js2smjpXzR8yJrlXO5xd
        PUR1EujyKl/I2IsxTLupqzPTIEuHKjM=
X-Google-Smtp-Source: ABdhPJyFDyrzwy7vnnZVjdHgkuH/8muxvlW4pg8QElFZTdnWYL9bQlKscnF+61+l1gajpxCnOg923w==
X-Received: by 2002:a17:906:ae41:: with SMTP id lf1mr11254078ejb.369.1610374363866;
        Mon, 11 Jan 2021 06:12:43 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id gb14sm6410106ejc.61.2021.01.11.06.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 06:12:42 -0800 (PST)
Date:   Mon, 11 Jan 2021 15:12:41 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-rtc@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v4 2/3] rtc: s5m: check the return value of
 s5m8767_rtc_init_reg()
Message-ID: <20210111141241.GA38402@kozik-lap>
References: <20210111124027.21586-1-brgl@bgdev.pl>
 <20210111124027.21586-3-brgl@bgdev.pl>
 <20210111133521.GB34341@kozik-lap>
 <CAMRc=MdLAupcMkSEpdVJiBTogbN6G2aqr=kC+0GT6s-igSSL0g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMRc=MdLAupcMkSEpdVJiBTogbN6G2aqr=kC+0GT6s-igSSL0g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, Jan 11, 2021 at 03:11:24PM +0100, Bartosz Golaszewski wrote:
> On Mon, Jan 11, 2021 at 2:35 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > On Mon, Jan 11, 2021 at 01:40:26PM +0100, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > >
> > > This function can fail if regmap operations fail so check its return
> > > value in probe().
> > >
> > > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > ---
> > >  drivers/rtc/rtc-s5m.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
> > > index eb9dde4095a9..e0011d3cf61b 100644
> > > --- a/drivers/rtc/rtc-s5m.c
> > > +++ b/drivers/rtc/rtc-s5m.c
> > > @@ -791,6 +791,8 @@ static int s5m_rtc_probe(struct platform_device *pdev)
> > >       platform_set_drvdata(pdev, info);
> > >
> > >       ret = s5m8767_rtc_init_reg(info);
> > > +     if (ret)
> > > +             return ret;
> >
> > You leak I2C device.
> >
> 
> Yes, the next patch fixes it but I changed the order. Actually this
> can be moved after 3/3 with no conflicts when applying.

Yes, but for bisecting and any backporting (e.g. with autosel) the order
is quite important. Please resend with new order.

Best regards,
Krzysztof

