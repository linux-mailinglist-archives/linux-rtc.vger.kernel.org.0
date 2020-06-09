Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA2BE1F493E
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Jun 2020 00:14:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728193AbgFIWOF (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 9 Jun 2020 18:14:05 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:46740 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726992AbgFIWOD (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 9 Jun 2020 18:14:03 -0400
Received: by mail-il1-f196.google.com with SMTP id h3so21898408ilh.13;
        Tue, 09 Jun 2020 15:14:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6+IKvoJBxDC0gkwKVy035Y+LyuzeC/PUgTKJmP456DM=;
        b=JI+2kDetuV8agBL7BeFquSGnPMhPlnUJlU2Fp37HfCMp9gTj7PuF60hkr7CufZLc2V
         KI2cYZvK3vvGhbiVOpVYaV0HERI17qxVyS1hWg0M7dvcw9VKBjn7Pr6t4KkXmWxJfiRm
         ed9gZM+UYQ9EbhxSIKA4zh6dAJP6cWUFFxsuOh1v5wLyZyr0jS8wQLWR07jtBjeKDGWX
         rb/sJHtDOww7OUkIxIfYFgE6/S9KfbflsZhfAfRjv2Et4BruUNv3ZtyREgu/E3rgqIAs
         exJHh8xHuw4k+eZkMG4WPnVSh7hrphzyXLb6ebGlukd1LDchrnnQgOBf3Tv14flvCbvW
         F6Yg==
X-Gm-Message-State: AOAM531YGvfAbwXRBtqFzf8c+pN2QW4IcAPrfnkB5GOfuMhN6peCXFzj
        JDEnT8HkcH3JC4p7wUY89tmuCFM=
X-Google-Smtp-Source: ABdhPJxoiaeJB5cWwPsTuM2+ydzCxHsKCMc4EpHF0wrt5zhCGpgU41tDnDwG7ZtBcfwEXj4QolvBWw==
X-Received: by 2002:a92:9f4b:: with SMTP id u72mr135479ili.273.1591740842955;
        Tue, 09 Jun 2020 15:14:02 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id p11sm8000193ioo.26.2020.06.09.15.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 15:14:02 -0700 (PDT)
Received: (nullmailer pid 1590865 invoked by uid 1000);
        Tue, 09 Jun 2020 22:14:01 -0000
Date:   Tue, 9 Jun 2020 16:14:01 -0600
From:   Rob Herring <robh@kernel.org>
To:     "Kevin P. Fleming" <kevin+linux@km6g.us>
Cc:     linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH] rtc: abx80x: Add support for autocalibration filter
 capacitor
Message-ID: <20200609221401.GA1492918@bogus>
References: <20200530123222.361104-1-kevin+linux@km6g.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200530123222.361104-1-kevin+linux@km6g.us>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Sat, May 30, 2020 at 08:32:22AM -0400, Kevin P. Fleming wrote:
> All of the parts supported by this driver can make use of a
> small capacitor to improve the accuracy of the autocalibration
> process for their RC oscillators. If a capacitor is connected,
> a configuration register must be set to enable its use, so a
> new Device Tree property has been added for that purpose.
> 
> Signed-off-by: Kevin P. Fleming <kevin+linux@km6g.us>
> Cc: Alessandro Zummo <a.zummo@towertech.it>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> To: linux-rtc@vger.kernel.org
> To: devicetree@vger.kernel.org
> ---
>  .../bindings/rtc/abracon,abx80x.txt           |  6 ++++
>  drivers/rtc/rtc-abx80x.c                      | 34 +++++++++++++++++++
>  2 files changed, 40 insertions(+)

Binding should be a separate patch?

> 
> diff --git a/Documentation/devicetree/bindings/rtc/abracon,abx80x.txt b/Documentation/devicetree/bindings/rtc/abracon,abx80x.txt
> index 2405e35a1bc0..ad5d59ed6f24 100644
> --- a/Documentation/devicetree/bindings/rtc/abracon,abx80x.txt
> +++ b/Documentation/devicetree/bindings/rtc/abracon,abx80x.txt
> @@ -29,3 +29,9 @@ and valid to enable charging:
>   - "abracon,tc-diode": should be "standard" (0.6V) or "schottky" (0.3V)
>   - "abracon,tc-resistor": should be <0>, <3>, <6> or <11>. 0 disables the output
>                            resistor, the other values are in kOhm.
> +
> +All of the devices can have a 47pf capacitor attached to increase the
> +autocalibration accuracy of their RC oscillators. To enable usage of the
> +capacitor the following property has to be defined:
> +
> + - "abracon,autocal-filter"

Can't the standard 'quartz-load-femtofarads' property be used here? You 
might not need to know the value, but presence of the property can 
enable the feature.

Rob
