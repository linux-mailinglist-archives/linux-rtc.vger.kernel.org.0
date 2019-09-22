Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D959EBA049
	for <lists+linux-rtc@lfdr.de>; Sun, 22 Sep 2019 04:47:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727135AbfIVCrB (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 21 Sep 2019 22:47:01 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:33031 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727120AbfIVCrB (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 21 Sep 2019 22:47:01 -0400
Received: by mail-pl1-f194.google.com with SMTP id d22so3631366pls.0;
        Sat, 21 Sep 2019 19:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=8k0SwpGf5Bb8pzeQ49ciEIxov4dZSC0LkZDesCWc830=;
        b=AcjrmN2xrPN9Upj5EftARXS0NiQknr5QW7pGihwKqAozuz7D6ABrCXROlyDdMBh1hE
         QuzT5wP4Wd1IgptjUpWKgonUBYHC+t8iw/rs0bD50f1CJBDpelF0gp9ybf/7vwv/WSDw
         4mkZq5pOYjpUgW+mXbxSFMaVlathPEZhlbDOb/cDAycP8c1aX3A6V33vL9Z0eDre9122
         LAVEzkK1ZvTi9A6UO863BAIa+IGeQqUIWq1pI81612envXbi95/WKPu1x9pLgFrTrKet
         wpR9qTzIqe+bczwHXrQtCIjwXF3YyUZBR07776ZJICjmOLxU4lHNGBPnczBgS5RVmOql
         +XYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8k0SwpGf5Bb8pzeQ49ciEIxov4dZSC0LkZDesCWc830=;
        b=qV6X+q2XxTNIVKplzo0CVVfFXOooXfYZkycA/2DJUhWpZyztG5GpDZk6y/32KT+PCQ
         IxifJRKKdIipSjXU5i83MqaZoLFmBKTv8rUJjV9EQFRBS+5R7xIfxl7W6nzPleHSVWsg
         u7YaoPnuHulZIkE32g+pGwjM6p2tsdCGnL+TWl10Se8ft8HTj99FbP8K1FgdCOZFAx+H
         nO4koKptkEi4eCvaAuJjErtULL249c7U8o+Ty7rM5Ddf1opAfrvGVs7esmLwUHMRhR7v
         vms1eART8VBrBJuwqfmnXbklg5PWubSrYaYTbOx+IDFkVqryzzdKAtEa1/k3NxJTo9jq
         rHIA==
X-Gm-Message-State: APjAAAXnse0LZJHjkUSQVMtPBmeb7lwzurZREKN8LnvmTFWLJW5GBtzV
        hrXpO1BcOlAw+Qk9FT8sYAR8Q1e/08ZkUONVItle+VgN
X-Google-Smtp-Source: APXvYqxuSbvo8IzNwrx0Up49F1PB+SWNCpx3+hjoX/VlOQO5BjNa9BTGAvtN2Qpck5ZddS1+RJgj/wZOzG8Yn53O6jI=
X-Received: by 2002:a17:902:a715:: with SMTP id w21mr24144340plq.274.1569120420100;
 Sat, 21 Sep 2019 19:47:00 -0700 (PDT)
MIME-Version: 1.0
References: <8c17a59c-82ff-aa6b-5653-a38d786d3e83@web.de>
In-Reply-To: <8c17a59c-82ff-aa6b-5653-a38d786d3e83@web.de>
From:   Akinobu Mita <akinobu.mita@gmail.com>
Date:   Sun, 22 Sep 2019 11:46:49 +0900
Message-ID: <CAC5umyjWuFH4iADS=_KYWsL=osdw1o56cdabjNftgSDsXzzLUw@mail.gmail.com>
Subject: Re: [PATCH] rtc: r7301: Use devm_platform_ioremap_resource() in rtc7301_rtc_probe()
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

2019=E5=B9=B49=E6=9C=8821=E6=97=A5(=E5=9C=9F) 20:49 Markus Elfring <Markus.=
Elfring@web.de>:
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 21 Sep 2019 13:43:07 +0200
>
> Simplify this function implementation by using a known wrapper function.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Reviewed-by: Akinobu Mita <akinobu.mita@gmail.com>
