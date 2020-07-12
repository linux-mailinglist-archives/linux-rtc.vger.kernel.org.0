Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6514621CAE0
	for <lists+linux-rtc@lfdr.de>; Sun, 12 Jul 2020 19:52:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729315AbgGLRwu (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 12 Jul 2020 13:52:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728882AbgGLRwt (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 12 Jul 2020 13:52:49 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F949C061794
        for <linux-rtc@vger.kernel.org>; Sun, 12 Jul 2020 10:52:49 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id dm12so4827600qvb.9
        for <linux-rtc@vger.kernel.org>; Sun, 12 Jul 2020 10:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=content-transfer-encoding:in-reply-to:date:to:cc:subject:from
         :message-id;
        bh=I6RgDv7I6BzR3fRixWuKh3VXZ7/kLD26tVkY0IngHss=;
        b=ZTwX2BwvuKAQfASwii/oenUh/1HejmV5T3VtzU+xsJYkEb+BLrOkjygXBckO/ltFGF
         2Kx9WEMkw/rwEMjyDQGQA6yEyviI6UMrNyefFHajjK7/3jG42mwG5ZXNPu3/G3vNoZMR
         F0eki3FG8MGG1bxr8XC/s7bHi7BnfW8CPAcxy/4juWSiAmiEv/w28ZFn41c8AU2aMVYe
         H5SXvmOOgGlDL4xB2/hYpaWhZp1q5UdKQp30V8G09ONbpfwwBKN99cSbIh5hBigZ3qdL
         Y6RhKd1DY9S0O5I+mNcXOTr6btX5NWZ7isKfc8AoiQNwVL+QYbNE4c2BmjVRG4cR1MSe
         OBYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:in-reply-to:date:to:cc
         :subject:from:message-id;
        bh=I6RgDv7I6BzR3fRixWuKh3VXZ7/kLD26tVkY0IngHss=;
        b=aDXuU2Hp0W6/Mq6mW53oMdiQtbDZrdSvcJIwSDme41IC1MOmRQpZ2g71bfF3SeVtGm
         xPqBaoQHJYR/vIoljGYqsJwXPpZ6b1GfqO9PWz4NjKZAHJ10TglinWWHU32YophjztwM
         +JRrWin4/bPbbySX1dj7o90RP6xiP79L+vrFxniiUyE7U5vWVmo7wsuGasveya+M9Cj6
         1aVrABZ/cQzkQaOM0MYYEBFAKubdzrLWCaIW7bwULmZ/jgJeo/n0E6/7JpXI9lb7x1F1
         FBrwFuZBhzBV0TF8WxGQHaFANK/f1GUatQxL/lVbTaDE5CfwoXJLD7BEHpWCzMX8yI52
         CC8g==
X-Gm-Message-State: AOAM530mcXyL3n+7wItHdeB6HmBNnW0lS1V/2FLqqm62XDjlxM5xpw1v
        IHSbNkwTphRBV0d+M02mmRqBzJiD
X-Google-Smtp-Source: ABdhPJyXzsJ1FbwY7uzr4ZVVeQjJvxhDZFCy62qPOQsh0GS+24udruM5IMSOMclj5Ix9QRdJn13O2Q==
X-Received: by 2002:a0c:ea8f:: with SMTP id d15mr52286100qvp.95.1594576367278;
        Sun, 12 Jul 2020 10:52:47 -0700 (PDT)
Received: from localhost (198-48-202-89.cpe.pppoe.ca. [198.48.202.89])
        by smtp.gmail.com with ESMTPSA id p5sm7231023qtb.62.2020.07.12.10.52.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 Jul 2020 10:52:46 -0700 (PDT)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <20200630024211.12782-1-liambeguin@gmail.com>
Date:   Sun, 12 Jul 2020 13:52:45 -0400
To:     "Liam Beguin" <liambeguin@gmail.com>, <bruno.thomsen@gmail.com>,
        <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>
Cc:     <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH v4 0/2] rtc: pcf2127: add alarm support
From:   "Liam Beguin" <liambeguin@gmail.com>
Message-Id: <C44U59I557TX.2UAJE5WK3M18L@atris>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon Jun 29, 2020 at 10:42 PM Liam Beguin wrote:
> From: Liam Beguin <lvb@xiphos.com>
>=20
> The board used to test this series has the interrupt line of the RTC
> connected to a circuit controlling the power of the board.
> An event on the interrupt line while the board is off will power it on.
> Because of these hardware limitations, the irq handler added in this
> patch wasn't fully tested.
>=20
> The alarm fuctionality was tested on a PCA2129, with:
>=20
> 	$ date "2010-10-10 10:10"
> 	Sun Oct 10 10:10:00 UTC 2010
> 	$ /usr/sbin/rtcwake -u -d /dev/rtc0  -s10 --mode off
> 	[ ... ]
> 	$ # power on after 10 seconds
>=20
> Changes since v1:
> - Document new compatible string for the pca2129
> - Add calls to pcf2127_wdt_active_ping after accessing CTRL2
> - Use sizeof(buf) instead of hadcoding value
> - Cleanup debug trace
> - Add interrupt handler and wakeup-source devicetree option
>=20
> Changes since v2:
> - Rebase on latest mainline tree
> - Remove redundant if in pcf2127_rtc_alarm_irq_enable
> - Remove duplicate watchdog ping in pcf2127_rtc_irq
> - Avoid forward declaration
> - Remove dev_err strings
> - Remove dev_dbg traces since they are now part of the core
> - Avoid unnecessary read in pcf2127_rtc_irq with regmap_write
> - Add extra rtc_class_ops struct with alarm functions
>=20
> Changes since v3:
> - Replace "goto irq_err" with "return IRQ_NONE" in interrupt handler
> - Add Reviewed-by trailers
>=20
> Liam Beguin (2):
>   rtc: pcf2127: add pca2129 device id
>   rtc: pcf2127: add alarm support
>=20

Hi Alexandre,

Did you get a change to take a look at this revision?
Thanks,

Liam

>  .../devicetree/bindings/rtc/trivial-rtc.yaml  |   2 +
>  drivers/rtc/rtc-pcf2127.c                     | 137 ++++++++++++++++++
>  2 files changed, 139 insertions(+)
>=20
> Interdiff against v3:
> diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
> index df09d3c6c5c3..4e99c45a87d7 100644
> --- a/drivers/rtc/rtc-pcf2127.c
> +++ b/drivers/rtc/rtc-pcf2127.c
> @@ -416,7 +416,7 @@ static irqreturn_t pcf2127_rtc_irq(int irq, void *dev=
)
> =20
>  	ret =3D regmap_read(pcf2127->regmap, PCF2127_REG_CTRL2, &ctrl2);
>  	if (ret)
> -		goto irq_err;
> +		return IRQ_NONE;
> =20
>  	if (ctrl2 & PCF2127_BIT_CTRL2_AF) {
>  		regmap_write(pcf2127->regmap, PCF2127_REG_CTRL2,
> @@ -427,11 +427,9 @@ static irqreturn_t pcf2127_rtc_irq(int irq, void *de=
v)
> =20
>  	ret =3D pcf2127_wdt_active_ping(&pcf2127->wdd);
>  	if (ret)
> -		goto irq_err;
> +		return IRQ_NONE;
> =20
>  	return IRQ_HANDLED;
> -irq_err:
> -	return IRQ_NONE;
>  }
> =20
>  static const struct rtc_class_ops pcf2127_rtc_alrm_ops =3D {
>=20
> base-commit: 7c30b859a947535f2213277e827d7ac7dcff9c84
> --=20
> 2.27.0
>=20
