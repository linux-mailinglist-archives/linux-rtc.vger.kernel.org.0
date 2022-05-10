Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0270C520EB8
	for <lists+linux-rtc@lfdr.de>; Tue, 10 May 2022 09:35:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230074AbiEJHjN (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 10 May 2022 03:39:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241534AbiEJHdT (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 10 May 2022 03:33:19 -0400
X-Greylist: delayed 56592 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 10 May 2022 00:29:21 PDT
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1F462A4A06;
        Tue, 10 May 2022 00:29:19 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 86EB020000D;
        Tue, 10 May 2022 07:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1652167758;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=78SwRfuIkXdOX10+Kuc7el4F9ko1j9nEWVkbYfW8LZE=;
        b=GdCwEFRMEtaNNfsHY6C2a6NrmZJst2FMbyFx4JqFaifUHhWVZ0254TRAIBy6qAKKv5bvGq
        M5DauLw4g6Z+VEc54JfZUymxg5NwvjX15K8REGbTrfVDA4F7o6hsq76mjOAWdAz4UE0fQN
        YvB0R8eQW9TSkjdUO7lknldDHPgdT6CY1aXMg7JQrzVPtuPG+MFl4s++xC78Blqxvz+7Hd
        iZ6r6Wk/nb77hgl+oXjt7CdZNw4a/jhmVOce5AumE3LAf1qsxrZMARtxO1dzawO6EON61o
        xxjZxMYd90qChnZvslM2ZoPfGr6A5PtJ6YWCb5GTwkPJYHaXOjEYabyqATD2Jw==
Date:   Tue, 10 May 2022 09:29:11 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     kernel test robot <lkp@intel.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
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
Message-ID: <20220510092911.5ab2f15a@xps13>
In-Reply-To: <202205100552.VY3kCkh5-lkp@intel.com>
References: <20220509154559.24851-3-miquel.raynal@bootlin.com>
        <202205100552.VY3kCkh5-lkp@intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Alex,

lkp@intel.com wrote on Tue, 10 May 2022 05:26:55 +0800:

> Hi Miquel,
>=20
> Thank you for the patch! Yet something to improve:
>=20
> [auto build test ERROR on abelloni/rtc-next]
> [also build test ERROR on robh/for-next linus/master v5.18-rc6 next-20220=
509]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>=20

[...]

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>=20
> All errors (new ones prefixed by >>):
>=20
> >> drivers/rtc/rtc-rzn1.c:23:10: fatal error: linux/soc/renesas/r9a06g032=
-sysctrl.h: No such file or directory =20
>       23 | #include <linux/soc/renesas/r9a06g032-sysctrl.h>
>          |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    compilation terminated.

That include is no longer needed in this driver (and should be merged
through another tree). Tell me if I need to resend or if you can fix it
while applying.

Thanks,
Miqu=C3=A8l
