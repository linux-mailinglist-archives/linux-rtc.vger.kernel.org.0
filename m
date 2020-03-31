Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76AC5199FD6
	for <lists+linux-rtc@lfdr.de>; Tue, 31 Mar 2020 22:14:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728187AbgCaUOJ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 31 Mar 2020 16:14:09 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:34462 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727937AbgCaUOI (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 31 Mar 2020 16:14:08 -0400
Received: by mail-il1-f195.google.com with SMTP id t11so20782533ils.1;
        Tue, 31 Mar 2020 13:14:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mi0F7xescdi5BUfbFSsgV16XAWuv/drpgItNLfvWHRA=;
        b=bIiV8y6nD7Kk6mmI2r8GzsegbsSlevbGDTZPxQfB9j2vVVDzlOiCmTNrhnDB903JiM
         +sRS/FDmFQIO4voniEVGCmwwkpgHM1hDf9S4ws5l7KVQww/JeibnzKqret+KNVo4yzbi
         PocnJGWzf6cYt9WIhljVo3JnyiDtUAtTX8TP/oDa/cdoIw9k78MpI/s4uvALj6sVSYMW
         6CQuuIFESL5S2XECfgzSjZ7EauqVP0S46su50ZEFxE4/8RgOJwutHlHbGIZQyeyfgSV+
         h/1LMBXBtucchbxkYjmMJHFwrQrA7RtJMkuOV5Q1AvxETOxcZPr+Y9R4QRDbqjO0mLI1
         o5jA==
X-Gm-Message-State: ANhLgQ3bdqRzpjU527hYqkiL1SWoyJN7TvpQZnKmN24TVBOILlsGbf+a
        wYKCCNK7Ab8To3XC2YfSNQ==
X-Google-Smtp-Source: ADFU+vsTyKde0ZJ+1HPBmeWqBwGUvGZ/RjDMO+08xxGhivNmr8zoJ1fODw6Mvfil941467xCRAilOg==
X-Received: by 2002:a92:8548:: with SMTP id f69mr18179772ilh.20.1585685647795;
        Tue, 31 Mar 2020 13:14:07 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id m129sm372341ioa.2.2020.03.31.13.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 13:14:06 -0700 (PDT)
Received: (nullmailer pid 24173 invoked by uid 1000);
        Tue, 31 Mar 2020 20:14:02 -0000
Date:   Tue, 31 Mar 2020 14:14:02 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sergey.Semin@baikalelectronics.ru
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Serge Semin <fancer.lancer@gmail.com>,
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
Message-ID: <20200331201402.GA13587@bogus>
References: <20200306125622.839ED80307C4@mail.baikalelectronics.ru>
 <20200324174325.14213-1-Sergey.Semin@baikalelectronics.ru>
 <20200324174325.14213-2-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200324174325.14213-2-Sergey.Semin@baikalelectronics.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, Mar 24, 2020 at 08:43:20PM +0300, Sergey.Semin@baikalelectronics.ru wrote:
> From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> Modern device tree bindings are supposed to be created as YAML-files
> in accordance with DT schema. This commit replaces Synopsys DW Timer
> legacy bare text binding with YAML file. As before the binding file
> states that the corresponding dts node is supposed to be compatible
> with generic DW APB Timer indicated by the "snps,dw-apb-timer"
> compatible string and to provide a mandatory registers memory range,
> one timer interrupt, either reference clock source or a fixed clock
> rate value. It may also have an optional APB bus reference clock
> phandle specified.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Alessandro Zummo <a.zummo@towertech.it>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-rtc@vger.kernel.org
> 
> ---
> 
> I have doubts that this binding file belongs to the bindings/rtc
> directory seeing it's a pure timer with no rtc facilities like
> days/months/years counting and alarms. What about moving it to the
> "Documentation/devicetree/bindings/timer/" directory?

+1

> I also don't know who is the corresponding driver maintainer, so I added
> Daniel Lezcano to the maintainers schema. Any idea what email should be
> specified there instead?
> 
> Please also note, that "oneOf: - required: ..." pattern isn't working
> here. So if you omit any of the clock-related property the
> dt_binding_check procedure won't fail. Seeing the anyOf schema is working
> I suppose this happens due to the dtschema/lib.py script, which replaces
> the global oneOf with a fixup for the interrupts/interrupts-extended
> properties:
> 
> > def fixup_interrupts(schema):
> >    # Supporting 'interrupts' implies 'interrupts-extended' is also supported.
> >    if not 'interrupts' in schema['properties'].keys():
> >        return
> >
> >    # Any node with 'interrupts' can have 'interrupt-parent'
> >    schema['properties']['interrupt-parent'] = True
> >
> >    schema['properties']['interrupts-extended'] = { "$ref": "#/properties/interrupts" };
> >
> >    if not ('required' in schema.keys() and 'interrupts' in schema['required']):
> >        return
> >
> !>    # Currently no better way to express either 'interrupts' or 'interrupts-extended'
> !>    # is required. If this fails validation, the error reporting is the whole
> !>    # schema file fails validation
> !>    schema['oneOf'] = [ {'required': ['interrupts']}, {'required': ['interrupts-extended']} ]

I'll fix this. I'll have to check for 'oneOf' and if it exists then put 
it under an 'allOf'.

> ---
>  .../devicetree/bindings/rtc/dw-apb.txt        | 32 -------
>  .../bindings/rtc/snps,dw-apb-timer.yaml       | 88 +++++++++++++++++++
>  2 files changed, 88 insertions(+), 32 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/rtc/dw-apb.txt
>  create mode 100644 Documentation/devicetree/bindings/rtc/snps,dw-apb-timer.yaml

Otherwise, looks good.

Reviewed-by: Rob Herring <robh@kernel.org>
