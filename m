Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C5C31918DF
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Mar 2020 19:22:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728088AbgCXSUx (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 24 Mar 2020 14:20:53 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:46613 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728047AbgCXSUw (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 24 Mar 2020 14:20:52 -0400
Received: by mail-lf1-f65.google.com with SMTP id q5so2203146lfb.13;
        Tue, 24 Mar 2020 11:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vZ2grX9EdtsDCTdMZUk+KGs8dumK5Lsw3WmRUPsPmLQ=;
        b=g9/9A+OyX8xJITb28HO9MKB6+cdg+n52KnynJT9xR6eCDDU3Xgg0ucNRZ6fgDnzsSf
         LjC5k/hBDKSg6GWsUm+VdneNJMaVgFNOaGB/xKBKIVcQAmEB/xjZ/3M8YEkJeCUjmB9M
         GzHm4Ctk5/9bkQt7bpe1K3Qdtn/ut2kVeTk48xb7qKCqo27MV7thqXYBmvDkm4KKHvcO
         gC5L4Uq2D3dyC59Moj++lKKAHRqfj6o3WliVPfJ+jSG16H+L0SWaIqzGKlaBYeKcAI80
         y8BGym5dGtclGStfcNoFa39gvxtFXj/Bks7ZG8EhJEZphRbld5Mf07Dy7Vz9+I35cMNF
         nysw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vZ2grX9EdtsDCTdMZUk+KGs8dumK5Lsw3WmRUPsPmLQ=;
        b=pehOLrjkfV53m51U+DQOZoYNoMeKeReKgJEjaB3t9jGoNxW3qZ8XP1Drm5VbhEXlhZ
         rl7htfsT5RFtb4mrcCWWKoY6opCk5OEDW4Z1TSuV8fOqBG0ZAbTrwHPkQOOdyW+vz0ay
         OcP6wg66DtzNbKDPjL4hpd+qtp19iWVWishhOOY7YyN/GAp02TTmwpeCjwmLfwJR33+g
         rQ5gP4QvGdNbq9IpBiYEKgFVNMknlkZ+3YXHV3FkM4/6l7vqGpFk0e6BYHb8k2Ok/LUH
         JN3cgaPjy9mvYlGN4Db91iFvH4Ci6Z5BOBKoCQbLIy/nossX/IyS1i63avvaLwLnM4xi
         dPzg==
X-Gm-Message-State: ANhLgQ0gHruR62C9u5uXnrbixVMW5HOAEKQ6jMI6CMBMbi+sof3M/wu3
        DQIYwQ1i7hu9gn7VQyllpls=
X-Google-Smtp-Source: ADFU+vtFvpq0POhOnkLU430bk6n5oSPRbp8Bisgt5nf1Ld/HAQp/Rad6pPPa6Xb4zIivCVN1cWWmVg==
X-Received: by 2002:a19:6f07:: with SMTP id k7mr13886435lfc.79.1585074050889;
        Tue, 24 Mar 2020 11:20:50 -0700 (PDT)
Received: from mobilestation ([95.79.136.110])
        by smtp.gmail.com with ESMTPSA id h10sm10603614ljg.38.2020.03.24.11.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 11:20:50 -0700 (PDT)
Date:   Tue, 24 Mar 2020 21:20:47 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Sergey.Semin@baikalelectronics.ru,
        Alessandro Zummo <a.zummo@towertech.it>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        devicetree@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: rtc: Convert snps,dw-apb-timer to DT
 schema
Message-ID: <20200324182047.iziujb7n7slqtzck@mobilestation>
References: <20200306125622.839ED80307C4@mail.baikalelectronics.ru>
 <20200324174325.14213-1-Sergey.Semin@baikalelectronics.ru>
 <20200324174325.14213-2-Sergey.Semin@baikalelectronics.ru>
 <20200324180709.GO5504@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200324180709.GO5504@piout.net>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello Alexandre

On Tue, Mar 24, 2020 at 07:07:09PM +0100, Alexandre Belloni wrote:
> Hi,
> 
> On 24/03/2020 20:43:20+0300, Sergey.Semin@baikalelectronics.ru wrote:
> > From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > 
> > Modern device tree bindings are supposed to be created as YAML-files
> > in accordance with DT schema. This commit replaces Synopsys DW Timer
> > legacy bare text binding with YAML file. As before the binding file
> > states that the corresponding dts node is supposed to be compatible
> > with generic DW APB Timer indicated by the "snps,dw-apb-timer"
> > compatible string and to provide a mandatory registers memory range,
> > one timer interrupt, either reference clock source or a fixed clock
> > rate value. It may also have an optional APB bus reference clock
> > phandle specified.
> > 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> > Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > Cc: Paul Burton <paulburton@kernel.org>
> > Cc: Ralf Baechle <ralf@linux-mips.org>
> > Cc: Alessandro Zummo <a.zummo@towertech.it>
> > Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-rtc@vger.kernel.org
> > 
> > ---
> > 
> > I have doubts that this binding file belongs to the bindings/rtc
> > directory seeing it's a pure timer with no rtc facilities like
> > days/months/years counting and alarms. What about moving it to the
> > "Documentation/devicetree/bindings/timer/" directory?
> > 
> 
> Exactly my reaction when seeing the patch, please move it out of
> bindings/rtc/
> 

Agreed. I am pretty sure Rob find something to be fixed and the main part
of the patchset still hasn't been reviewed. So v3 will be necessary for sure.
I'll move this binding out of rtc in a dedicated patch then.

-Sergey

P.S. For some reason your email still hasn't been delivered to my corporate
email, so responding from the private one.

> 
> -- 
> Alexandre Belloni, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
