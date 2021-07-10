Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 974443C2C26
	for <lists+linux-rtc@lfdr.de>; Sat, 10 Jul 2021 02:41:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230519AbhGJAnq (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 9 Jul 2021 20:43:46 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:37787 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229846AbhGJAnq (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 9 Jul 2021 20:43:46 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 4D863200002;
        Sat, 10 Jul 2021 00:40:59 +0000 (UTC)
Date:   Sat, 10 Jul 2021 02:40:59 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Cc:     Mathew McBride <matt@traverse.com.au>, linux-rtc@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: rtc: add Epson RX-8025 and RX-8035
Message-ID: <YOjsm9wujqczPIKw@piout.net>
References: <20210707071616.28976-1-matt@traverse.com.au>
 <20210707071616.28976-3-matt@traverse.com.au>
 <CABMQnVL379GkR_s5c91a0LAPMemup_Lq8U+qU9M1-kBWfVqmTw@mail.gmail.com>
 <YOYiDlQM/xfgb0CH@piout.net>
 <CABMQnV+zxURp2K3aXjH3cobndoAXjTdb4xB4w+mMJmjnwyPyLg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABMQnV+zxURp2K3aXjH3cobndoAXjTdb4xB4w+mMJmjnwyPyLg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello,

On 09/07/2021 16:19:49+0900, Nobuhiro Iwamatsu wrote:
> Hi,
> 
> 2021年7月8日(木) 6:52 Alexandre Belloni <alexandre.belloni@bootlin.com>:
> >
> > On 08/07/2021 06:46:31+0900, Nobuhiro Iwamatsu wrote:
> > > Hi,
> > >
> > > 2021年7月7日(水) 16:17 Mathew McBride <matt@traverse.com.au>:
> > > >
> > > > These are supported by the rtc-rx8025 module. RX-8025
> > > > also has support in ds1307 due to compatible time registers.
> > > >
> > > > Signed-off-by: Mathew McBride <matt@traverse.com.au>
> > > > ---
> > > >  Documentation/devicetree/bindings/rtc/trivial-rtc.yaml | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
> > > > index 7548d8714871..13925bb78ec7 100644
> > > > --- a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
> > > > +++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
> > > > @@ -32,6 +32,9 @@ properties:
> > > >        - dallas,ds3232
> > > >        # I2C-BUS INTERFACE REAL TIME CLOCK MODULE
> > > >        - epson,rx8010
> > > > +      # I2C-BUS INTERFACE REAL TIME CLOCK MODULE
> > > > +      - epson,rx8025
> > > > +      - epson,rx8035
> > >
> > > 'epson,rx8035' is unnsecessary.
> > > This lists compatible string, so we don't list compatible that doesn't exist.
> > >
> >
> > Well, the previous patch adds it.
> >
> 
> I couldn't find anything to add "epson,rx8035" as device tree compatible in
> previous patch(rtc: rx8025: implement RX-8035 support)....
> I think that i2c_device_id was added and it is not device tree compatible.
> Can you tell me if my understanding is wrong?

Having "rx8035" in the struct i2c_device_id array is enough to have the
driver probed using DT. IIRC, it is a side effect of
i2c_of_match_device_sysfs()

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
