Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 483365246F1
	for <lists+linux-rtc@lfdr.de>; Thu, 12 May 2022 09:28:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351040AbiELH2I (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 12 May 2022 03:28:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351026AbiELH2C (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 12 May 2022 03:28:02 -0400
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BD8A13B8CA;
        Thu, 12 May 2022 00:27:58 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id B805C1BF207;
        Thu, 12 May 2022 07:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1652340476;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NUs5wwKMK9ZCjh5FZg+hajEWrINwlvOiOOXpphFtG4c=;
        b=IsxfZbFMMEMzqc0Cg78O5uFWNP5AK25KdkWm38g+7wAQWfQVwVG5DLbzUdnZWVPlxOdG9D
        0PQTD1LRatZlDQ4EWuLwXOfEE3dNMX0ghMJhG25Iz9wtectScT1PR2jEpYGCib73z74zxF
        +/v/TquPwUDwp7zBsrKjsz8jLrMVKdJGVcg1vVOloP39+RIlgER3YcSlQQsPx0hZ1PWfNx
        yrG3hNIA1xFZzKdlSh73KLxnu2oP3It8RnC/bFom9fypTY0pkEW/bOgW2LQEy9eHRB73F+
        fhHOe8f3ie5g3qIEHVT77BHVtUOafCp4bD/B0m/UoA+c+32D0adOrJ1Wh63ghg==
Date:   Thu, 12 May 2022 09:27:48 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     kernel test robot <lkp@intel.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, kbuild-all@lists.01.org,
        linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        Michel Pollet <michel.pollet@bp.renesas.com>
Subject: Re: [PATCH v4 2/5] rtc: rzn1: Add new RTC driver
Message-ID: <20220512092748.4c762c1a@xps13>
In-Reply-To: <79fbc9ce-f815-a886-db6c-9ccdf7be4e53@linaro.org>
References: <20220509154559.24851-3-miquel.raynal@bootlin.com>
        <202205100552.VY3kCkh5-lkp@intel.com>
        <20220510092911.5ab2f15a@xps13>
        <79fbc9ce-f815-a886-db6c-9ccdf7be4e53@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Krzysztof,

krzysztof.kozlowski@linaro.org wrote on Tue, 10 May 2022 12:06:39 +0200:

> On 10/05/2022 09:29, Miquel Raynal wrote:
> >  =20
> >> If you fix the issue, kindly add following tag as appropriate
> >> Reported-by: kernel test robot <lkp@intel.com>
> >>
> >> All errors (new ones prefixed by >>):
> >> =20
> >>>> drivers/rtc/rtc-rzn1.c:23:10: fatal error: linux/soc/renesas/r9a06g0=
32-sysctrl.h: No such file or directory   =20
> >>       23 | #include <linux/soc/renesas/r9a06g032-sysctrl.h>
> >>          |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >>    compilation terminated. =20
> >=20
> > That include is no longer needed in this driver (and should be merged
> > through another tree). Tell me if I need to resend or if you can fix it
> > while applying. =20
>=20
> This should be resent so we are sure that no other warnings are reported.

Ok, I'll edit the file and resend.

Thanks,
Miqu=C3=A8l
