Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25F6132230F
	for <lists+linux-rtc@lfdr.de>; Tue, 23 Feb 2021 01:16:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231210AbhBWAQH (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 22 Feb 2021 19:16:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:59028 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231148AbhBWAQF (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 22 Feb 2021 19:16:05 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id F114464E6B;
        Tue, 23 Feb 2021 00:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614039325;
        bh=yuNOWr6epIq3Wlud5uP8xIKIBMjJK2yn5SDZKLuyorc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=nrrOAOWhfAxrqBqW6zdUQ9AYIhXMj3+rx9v9TXWmfsANW/laPnDNqyAGxGTEZ98RN
         +AnwrVg8CwGgPxmGewY3V00oZ6sagoiACyRiUTbAKleHSpewk104VyuffC91Gx3KI+
         InO2coU3mvrT+Vb9pt+FMJuYz+TXXuTZ4IxvTiprbhlbHAf9VdjhSZ71muJhOg49x+
         KW1qwApz6TQAf7yId7JjVQdwgOFUURqz3JgkNQmBYODVCAIZhyR2DaoJ/xULqHaHDc
         FSaK/55HNWEbzWeCgQU8lXn0D72Htt62P/h7TWn/pqHr2/junFYpgUUl9+GE+31M0S
         H5ymCZqDOdQkQ==
Received: by mail-ed1-f46.google.com with SMTP id g3so24007886edb.11;
        Mon, 22 Feb 2021 16:15:24 -0800 (PST)
X-Gm-Message-State: AOAM531VxviMAviP9c6fsX4wNbq4q2oQ/0Zn74ewMzms/VxB5e2Hnr42
        VE3DpPMPh/bMozY5y/rzcGGzXODB/W/D75tuBw==
X-Google-Smtp-Source: ABdhPJxC1NKoxwxD2oa+gmcOFlIXozbx4BR9iOXurfi4O1cDdre+NLJfpRIzrex8warqlYx35YmdXAQJQ76fqo/y0Jc=
X-Received: by 2002:a05:6402:164e:: with SMTP id s14mr12469239edx.62.1614039323392;
 Mon, 22 Feb 2021 16:15:23 -0800 (PST)
MIME-Version: 1.0
References: <20210222171247.97609-1-sebastian.reichel@collabora.com> <20210222171247.97609-6-sebastian.reichel@collabora.com>
In-Reply-To: <20210222171247.97609-6-sebastian.reichel@collabora.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 22 Feb 2021 18:15:11 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLmcRqFW5ufy-zY9dfqpiwACxfOHrrGphTx2UGMBVj-7w@mail.gmail.com>
Message-ID: <CAL_JsqLmcRqFW5ufy-zY9dfqpiwACxfOHrrGphTx2UGMBVj-7w@mail.gmail.com>
Subject: Re: [PATCHv1 5/6] dt-bindings: mtd: jedec,spi-nor: add sst25vf032b
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        devicetree@vger.kernel.org,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>,
        MTD Maling List <linux-mtd@lists.infradead.org>,
        Collabora Kernel ML <kernel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, Feb 22, 2021 at 11:13 AM Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> The binding is already used by the driver. Update documentation
> accordingly.
>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt | 1 +
>  1 file changed, 1 insertion(+)

This is now DT schema format. Landed in Linus' tree today.

Rob
