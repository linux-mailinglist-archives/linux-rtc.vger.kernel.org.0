Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BFF840139
	for <lists+linux-rtc@lfdr.de>; Tue, 11 Jun 2019 22:32:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389150AbfFKUcR (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 11 Jun 2019 16:32:17 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:39998 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388533AbfFKUcR (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 11 Jun 2019 16:32:17 -0400
Received: by mail-lj1-f196.google.com with SMTP id a21so12982757ljh.7;
        Tue, 11 Jun 2019 13:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HG+Jj5aLWSzQxxzhDq7lYfn2XSZ1Scwtl7BQOvyxWdg=;
        b=iyDoFK5Fqv4+mMjPk1rfviS2aSrrgTJJme217/trpc2PivuZtugt8R0+H01Lf4OscE
         4AGGya94adu38DxwHDJmsBPnZv/hSxxNFrZg8R1h60+fufDMbg/kElTC36aKEBsz9Xw2
         1rX6ELf2EIp9aukcNxr1UZUoE1yu65sMae/DQW/goAGDngTUI4ZOrL1XYdNWWBD8Abcz
         Ptp0JFep8n5KiQefxnuADK9plHczZZXubz+nC8B3oJyk7U6ASqVc1RDigsaSPNYxiDo8
         kXngM1xwEoXmra5iphF95M8qrpxiGtMjGZ0MBb02pnxTp/QZpcHe3XPz4Q6KFnDCNlHh
         L0xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HG+Jj5aLWSzQxxzhDq7lYfn2XSZ1Scwtl7BQOvyxWdg=;
        b=FoY+6D8J+8c6kOYAebaQrEIvEoSMaxQHsiyqn+tx2xEwvdvcV7PKczdf2z56JY3srq
         OopRT2rVy5t8PLgrzjKx20TCzangc1OtpE8sp2nGmYIQBNMz1xnD4M8dEZm2Et3y2Rfp
         Kn62kQLwT1EXdt/sQKFWpRZ4hqTImNMZj8COgcdBduZBgdRXZBFVAnlEklrWtgZzuvof
         0QCdegAil9/hcmtYeIpWMAJf3J20SUM4UU8bB0h/Wt9+euyOfT7gcA/EFu9EA33okiE3
         jkR9pggMV21UujDLhKZJ2ENT1sl8vgA7c0Ynp1OQJmo4OTKPO01BBOqoxfvdU2Il3GPc
         Qq/A==
X-Gm-Message-State: APjAAAX6RDAmGUKOCf/a+PkW2QDz6sxozMVMkLobVNJu9TUeF0BMUCs+
        4kOXIrjjfb2SPT8gNW3ziwXBWRQ91hEfdIuFkeE=
X-Google-Smtp-Source: APXvYqwH8mDirGvZFSQ++GGm3boVzKdaAPryfUMMKcxHOo7RgZUTNJsvQR5zKXzNZVh8HStluVu0VXpWSud2ZPpNp04=
X-Received: by 2002:a2e:994:: with SMTP id 142mr11048542ljj.130.1560285134666;
 Tue, 11 Jun 2019 13:32:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190611063333.48501-1-Anson.Huang@nxp.com> <20190611063333.48501-2-Anson.Huang@nxp.com>
In-Reply-To: <20190611063333.48501-2-Anson.Huang@nxp.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 11 Jun 2019 17:32:13 -0300
Message-ID: <CAOMZO5BCuBKHs1jXkm3qFD84_xcB=0NSwE3SLJHx9kq4Stbd_A@mail.gmail.com>
Subject: Re: [PATCH 2/3] rtc: imx-sc: Make compatible string more generic
To:     Yongcai Huang <Anson.Huang@nxp.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        alexandre.belloni@bootlin.com, Dong Aisheng <aisheng.dong@nxp.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Peng Fan <peng.fan@nxp.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>, NXP Linux Team <Linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Anson,

On Tue, Jun 11, 2019 at 3:31 AM <Anson.Huang@nxp.com> wrote:
>
> From: Anson Huang <Anson.Huang@nxp.com>
>
> i.MX system controller RTC driver can support all i.MX SoCs
> with system controller inside, this patch makes the compatible
> string more generic to support other i.MX SoCs with system
> controller inside, such as i.MX8QM etc..
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  drivers/rtc/rtc-imx-sc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/rtc/rtc-imx-sc.c b/drivers/rtc/rtc-imx-sc.c
> index c933045..38ef3ca 100644
> --- a/drivers/rtc/rtc-imx-sc.c
> +++ b/drivers/rtc/rtc-imx-sc.c
> @@ -178,7 +178,7 @@ static int imx_sc_rtc_probe(struct platform_device *pdev)
>  }
>
>  static const struct of_device_id imx_sc_dt_ids[] = {
> -       { .compatible = "fsl,imx8qxp-sc-rtc", },
> +       { .compatible = "fsl,imx-sc-rtc", },

What is wrong with the current compatible string?

If you want to support i.MX8QM just add in its dtsi:

compatible = "fsl,imx8qm-sc-rtc", "fsl,imx8qxp-sc-rtc"

and add a dt-bindings entry for "fsl,imx8qm-sc-rtc"
