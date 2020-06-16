Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6D5F1FAB8B
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Jun 2020 10:45:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726471AbgFPIpm (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 16 Jun 2020 04:45:42 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:41153 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726467AbgFPIpl (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 16 Jun 2020 04:45:41 -0400
Received: from localhost (lfbn-lyo-1-15-81.w86-202.abo.wanadoo.fr [86.202.110.81])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 7679C100004;
        Tue, 16 Jun 2020 08:45:39 +0000 (UTC)
Date:   Tue, 16 Jun 2020 10:45:39 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Bruno Thomsen <bruno.thomsen@gmail.com>
Cc:     Liam Beguin <liambeguin@gmail.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] rtc: pcf2127: add pca2129 device id
Message-ID: <20200616084539.GF241261@piout.net>
References: <20200614040409.30302-1-liambeguin@gmail.com>
 <20200614040409.30302-2-liambeguin@gmail.com>
 <CAH+2xPAorviPx+b6kf2poqO49r_gnk1mARDj+9oqJYtwZWesig@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH+2xPAorviPx+b6kf2poqO49r_gnk1mARDj+9oqJYtwZWesig@mail.gmail.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 16/06/2020 10:17:21+0200, Bruno Thomsen wrote:
> Den søn. 14. jun. 2020 kl. 06.04 skrev Liam Beguin <liambeguin@gmail.com>:
> >
> > From: Liam Beguin <lvb@xiphos.com>
> >
> > The PCA2129 is the automotive grade version of the PCF2129.
> > add it to the list of compatibles.
> >
> > Signed-off-by: Liam Beguin <lvb@xiphos.com>
> > ---
> > Changes since v1:
> > - Document new compatible string for the pca2129
> >
> >  Documentation/devicetree/bindings/rtc/trivial-rtc.yaml | 2 ++
> >  drivers/rtc/rtc-pcf2127.c                              | 3 +++
> >  2 files changed, 5 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
> > index 18cb456752f6..c7d14de214c4 100644
> > --- a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
> > +++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
> > @@ -52,6 +52,8 @@ properties:
> >        - nxp,pcf2127
> >        # Real-time clock
> >        - nxp,pcf2129
> > +      # Real-time clock
> > +      - nxp,pca2129
> >        # Real-time Clock Module
> >        - pericom,pt7c4338
> >        # I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
> 
> Split device tree binding update into separate patch and
> remember to add devicetree@vger.kernel.org mailing list
> when you send the next patch series version.
> 

For trivial rtc, it is not really necessary to separate the binding doc,
especially when simply adding a compatible string.

> /Bruno
> 
> > diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
> > index 4e50d6768f13..396a1144a213 100644
> > --- a/drivers/rtc/rtc-pcf2127.c
> > +++ b/drivers/rtc/rtc-pcf2127.c
> > @@ -546,6 +546,7 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
> >  static const struct of_device_id pcf2127_of_match[] = {
> >         { .compatible = "nxp,pcf2127" },
> >         { .compatible = "nxp,pcf2129" },
> > +       { .compatible = "nxp,pca2129" },
> >         {}
> >  };
> >  MODULE_DEVICE_TABLE(of, pcf2127_of_match);
> > @@ -656,6 +657,7 @@ static int pcf2127_i2c_probe(struct i2c_client *client,
> >  static const struct i2c_device_id pcf2127_i2c_id[] = {
> >         { "pcf2127", 1 },
> >         { "pcf2129", 0 },
> > +       { "pca2129", 0 },
> >         { }
> >  };
> >  MODULE_DEVICE_TABLE(i2c, pcf2127_i2c_id);
> > @@ -720,6 +722,7 @@ static int pcf2127_spi_probe(struct spi_device *spi)
> >  static const struct spi_device_id pcf2127_spi_id[] = {
> >         { "pcf2127", 1 },
> >         { "pcf2129", 0 },
> > +       { "pca2129", 0 },
> >         { }
> >  };
> >  MODULE_DEVICE_TABLE(spi, pcf2127_spi_id);
> > --
> > 2.27.0
> >

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
