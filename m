Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9694C39A415
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Jun 2021 17:13:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231213AbhFCPPf (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 3 Jun 2021 11:15:35 -0400
Received: from mail-vs1-f43.google.com ([209.85.217.43]:39832 "EHLO
        mail-vs1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230138AbhFCPPe (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 3 Jun 2021 11:15:34 -0400
Received: by mail-vs1-f43.google.com with SMTP id z206so3173631vsz.6
        for <linux-rtc@vger.kernel.org>; Thu, 03 Jun 2021 08:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Ieapn99oA9OkrHs7OsxYMHgBOluz5xhMTXD+Y3GBze4=;
        b=a5P9+eUjeu/Wk8Il/C541ZmfAdZc0ljy6YCupZtsL1LKbq3b+KSyum1lnsSFqNE0Qk
         EWBx04nI77pZK2ai1MNGl/qynJClqdgeuh3cgJLnGOByWW9a1XdiN+8c7LvWk55lbKKO
         nfIqFYSN5JB22KR43M2a82pRtpJSmFg20al+Tf9SoUIwLYsjwAcmNPMqrVyDg4pyuPRE
         Twe+MWaQdilQmA52ijCqxL2synPAZyzKegzDsRlTjsA4dB7L2W+ywxSumw++tfmKH+wZ
         U1DZEIAunFy0tqLt7CCf2bvftJFOyw36pPC5Dky9sJXSwMatFdt8qQM8qVIcfn3aky3g
         orUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Ieapn99oA9OkrHs7OsxYMHgBOluz5xhMTXD+Y3GBze4=;
        b=PupZdYwfDjX2w4fmg27p8DAAZ81pTQDOUpR01Pb/lWHhOlbzybmt+p63ivlMv4cy5F
         uuDlT2KnguH8NOaXfyt3bVLeWvJUFhtLGgwlKRurmz1GqB9Lt07xfr4hzXWhT8j5qPqT
         UwNG3oEuLEpNY9ElByEU+qokDz/S0aM8ziXRiEhK8TkHhHaHEMEueAohte16CTuZWkxa
         qSXxi/LNBapYVsfYBaaoOmZKJl2VphSTZwSEDHoYRjYqk9VaquxPn5gfFyNcsd+MAcBv
         UMvKgqZaNHOUwXz93NVbqR1T5FRYamodhr9vByXmfqBdtdcXdkOvG29LwvKi/tlCV+Gt
         Ybaw==
X-Gm-Message-State: AOAM533DPu3wGWBnljKoEp0PYQU+r6KsVXClgnKJ7THquo/exDbQXKig
        +OKnuOYIAVKjVp6v0TwPQiiAPNolmoKW6JTf6CJ6
X-Google-Smtp-Source: ABdhPJz/ttLqAlW8pbs0ubUg+RAi2P7whHE4JNsM/P7v5ksKIQDBWx7Bbr0eswUAn+HcMRTvw7UCv8XuQTjNDX46AaI=
X-Received: by 2002:a05:6102:c49:: with SMTP id y9mr649647vss.24.1622733154378;
 Thu, 03 Jun 2021 08:12:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210603143447.2223353-1-festevam@gmail.com> <20210603143447.2223353-2-festevam@gmail.com>
In-Reply-To: <20210603143447.2223353-2-festevam@gmail.com>
From:   Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Date:   Fri, 4 Jun 2021 00:12:08 +0900
Message-ID: <CABMQnVJix7n5d8zK0f3nstmOGeEVmVWAgbUY=M5kubGQZNQkBg@mail.gmail.com>
Subject: Re: [PATCH 2/3] rtc: pcf85063: Fix the datasheet URL
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

2021=E5=B9=B46=E6=9C=883=E6=97=A5(=E6=9C=A8) 23:36 Fabio Estevam <festevam@=
gmail.com>:
>
> The current datasheet URL is no longer valid.
>
> Replace with a valid one.
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  drivers/rtc/rtc-pcf85063.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/rtc/rtc-pcf85063.c b/drivers/rtc/rtc-pcf85063.c
> index 82becae14229..9a5297098d39 100644
> --- a/drivers/rtc/rtc-pcf85063.c
> +++ b/drivers/rtc/rtc-pcf85063.c
> @@ -21,8 +21,8 @@
>  /*
>   * Information for this driver was pulled from the following datasheets.
>   *
> - *  https://www.nxp.com/documents/data_sheet/PCF85063A.pdf
> - *  https://www.nxp.com/documents/data_sheet/PCF85063TP.pdf
> + *  https://www.nxp.com/docs/en/data-sheet/PCF85063A.pdf
> + *  https://www.nxp.com/docs/en/data-sheet/PCF85063TP.pdf
>   *
>   *  PCF85063A -- Rev. 6 =E2=80=94 18 November 2015

Could you also update Rev and date?

>   *  PCF85063TP -- Rev. 4 =E2=80=94 6 May 2015
> --
> 2.25.1
>

Best regards,
  Nobuhiro

--=20
Nobuhiro Iwamatsu
   iwamatsu at {nigauri.org / debian.org}
   GPG ID: 40AD1FA6
