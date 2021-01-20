Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FED02FCB22
	for <lists+linux-rtc@lfdr.de>; Wed, 20 Jan 2021 07:44:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726540AbhATGk4 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 20 Jan 2021 01:40:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726700AbhATGiY (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 20 Jan 2021 01:38:24 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E8C7C061575;
        Tue, 19 Jan 2021 22:37:43 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id o13so32696684lfr.3;
        Tue, 19 Jan 2021 22:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=lg9KNdx/DheREqatTUggClFpgYqzUQB6QxoMiw5d4bE=;
        b=Q54gqpBT5WdTPa0dw/VQJndPZ+pzowMMLlzsQYUdqhuEmOCf2ml+cRPifoIM5RCuq8
         F7rxnVAGym6RMUlHKoIT+0J6TjFCYvTutaw6CXulFaotUBBPVLMwmpR70WgODKoIGz5M
         AsgJMroNtw/oec62z7uqUVB22w68RHiVSU6rMamfEDq6a1gFLvyGvDuYkGB8gKYMnGwK
         CDiZM1iWhae2kZjc/+hx7WjMBGowRWxTGQcSzmsXsukL39FESxah5RRdPmROkK24XTPg
         0GSjiUYZ8xSr1nlFKW3e+sg6sIVktik2muRKdIXPv15mK5KjRE8k48a7z1rB7YfaxCZo
         A2Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=lg9KNdx/DheREqatTUggClFpgYqzUQB6QxoMiw5d4bE=;
        b=IUXS2LQ/z2lrwNc9FGgyy7oFXP72HWBVMwnhrMQyqPHnIK62HQt3HWq5DK2de5gmCL
         gDiJCvE3m7KtUZfGKgq/8dAOfnZLShXbPnTaNfboMdBuIZvZOY4piua/rq0rpOaMvyMY
         Z9IofZA0IxeIBfCq11s+DluEf+MpuP0/8gu6cV+OWP5teGuTTz6hzrYt9DAzWTzysOAV
         yzCzxQj7QCu1y9hCsrM67FaSPgNJpfoCQStQeXdTLyEy0iKINGO9EvLPgjrj/xLgNnsj
         oVR+ALwIna2rRYVq8sLRLgOSVvSyuxkms7WdfRU8m76Vb6RLFMqIYXNI77dY2P2jnZ4t
         lMRA==
X-Gm-Message-State: AOAM532HshYWnofqKsHNZbvCk56whynlsIlfnv4fgy+a0H8EnfLaIeB7
        wp/qBnI1Pm8nQAOxV8FfArY=
X-Google-Smtp-Source: ABdhPJz5iO2kZWyhMQZ/AwhYN2IrRxZKMZiC+Z5C06ZPcSYhw4h+h1DbYiMruVZU7Kzt9ooIIGPurw==
X-Received: by 2002:a19:810:: with SMTP id 16mr3554731lfi.233.1611124661811;
        Tue, 19 Jan 2021 22:37:41 -0800 (PST)
Received: from localhost.localdomain (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id y9sm99951ljm.94.2021.01.19.22.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 22:37:41 -0800 (PST)
Message-ID: <b82285438b7332a4aba5e0e73a07b2b79b45447b.camel@gmail.com>
Subject: Re: [PATCH v2 02/17] rtc: bd70528: Do not require parent data
From:   Matti Vaittinen <mazziesaccount@gmail.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-kernel@vger.kernel.org, linux-power@fi.rohmeurope.com,
        linux-rtc@vger.kernel.org, Simon Glass <sjg@chromium.org>
Date:   Wed, 20 Jan 2021 08:37:40 +0200
In-Reply-To: <20210119210920.GR3666@piout.net>
References: <cover.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
         <e113a308ee6e9d22ca7fae066119def1793068d9.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
         <20210119210920.GR3666@piout.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


On Tue, 2021-01-19 at 22:09 +0100, Alexandre Belloni wrote:
> On 19/01/2021 09:14:45+0200, Matti Vaittinen wrote:
> > The ROHM BD71828 and BD71815 RTC drivers only need the regmap
> > pointer from parent. Regmap can be obtained via dev_get_regmap()
> > so do not require parent to populate driver data for that.
> > 
> > BD70528 on the other hand requires parent data to access the
> > watchdog so leave the parent data for BD70528 here for now.
> > 
> > Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> 
> > ---
> > 
> > Please note that this same change has been sent individually:
> > https://lore.kernel.org/lkml/20210105152350.GA3714833@localhost.localdomain/
> > It is present in this series only because some patches depend on
> > it.
> > 
> 
> Then I think it is best to have it as part of this series.

Thanks for taking a look at this Alexandre! I'll keep the patch in the
series and remove this comment from cover-letter and the patch. (I
guess you have now dropped the previously sent patch).

> 
> > ~~~ "I don't think so," said Rene Descartes. Just then he vanished
> > ~~~
> 
> I've alway wanted to comment on that, should he have to say "I don't
> think" to vanish ? Because saying "I don't think so," means that he
> thinks this is not so.

My interpretation is he really was disagreeing and intended to say "he
doesn't think so". It was just the saying which made him to disappear.
This is what may happen when you have strong principles ^_^; What is
interesting to me is that he was able to add the "so" before vanishing.
This makes me believe it was required the information about him saying
this must've reached someone before the action was taken. If we make
some assumptions and a rough estimates we can compute the maximum
distance for this "something" that must've received the information
about the event.

I now assume that saying "so" can't really take longer than 10ms. I
also take into account the current state of physics - which means that
maximum speed for delivering the information is the speed of light, C.

I further guess that first the information about the event must've
reached this "something" - and then this "something" must've sent some
'make him vanish' event back. Again we take the speed-of-light as a
restriction.

So, poor Rene was no further than 0.01 * C/2 km away from the
"something" - when C is the speed of light using km/s as unit. 

I think it is safe to say that when you say "you're not thinking" you
should ensure you're further than 150 000 km away from "something"
which can make you to vanish.

> 
> > Simon says - in Latin please.
> > ~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
> 
> And I guess this should be simply "non cogito" ;)

I think we should definitely discuss this with Simon Glass if we ever
happen to be in a same location :] After all, he did the Latin
translation for me. I can't really speak Latin - but I can always lead
the discussion to some side-tracks XD


Best Regards
	Matti Vaittinen


