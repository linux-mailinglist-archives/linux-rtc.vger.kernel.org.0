Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BE6963EC06
	for <lists+linux-rtc@lfdr.de>; Thu,  1 Dec 2022 10:10:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230042AbiLAJKk (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 1 Dec 2022 04:10:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230046AbiLAJKj (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 1 Dec 2022 04:10:39 -0500
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com [IPv6:2607:f8b0:4864:20::92b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1C2963D7E
        for <linux-rtc@vger.kernel.org>; Thu,  1 Dec 2022 01:10:38 -0800 (PST)
Received: by mail-ua1-x92b.google.com with SMTP id 97so390615uam.0
        for <linux-rtc@vger.kernel.org>; Thu, 01 Dec 2022 01:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gsC1t8WmwUiEtaZQgKXFZjqGvYAcvsCPNwFBSFBFTtg=;
        b=8V1T51rmYJrC4JIMroQP6QRSyfai8iSDgn/4akzEsbqPgfl1oskw3YeuvhYvxch/hQ
         HjLGFwk68Wp8QYgA+8q4e7ed0njfEKM5BPgjHRh73J1yBZKkj/5nQ19seQTHVmOZYswn
         VwZTtzhw0MqtauUEFgeReiBSHNs95WbnzDfXgNhx/6H79nsu/LSBIBHyaRva4eIBl2ui
         F3vA1NaEl/iCl6zn4aOST71eW1UwSUfG6CjNf0yWGaZfIBc4EN33R4sJUxKVCEZg3rap
         vpDL7FMwhtcXdPmCsplTWInFWefCWu8yYtJQyp29UDsjetBilPBfpR+kd42e11frFmap
         VLtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gsC1t8WmwUiEtaZQgKXFZjqGvYAcvsCPNwFBSFBFTtg=;
        b=KWY0eGcSd2HJh+i+QZzmGjQGOqn6EXnXvIbZuVNK2yPin4xSGt8XkdRTxtrVGMPd2J
         sJWXLEyLalpzFAm4MYAV642FXyIj3HMBAkuGdQYO94owIg9+uVauc4TdbPDqqXe45Uk/
         fk9WR2NnBDQZyhBsV4LJE81zKOl3VSeZrCbbW4jTDA4MZgq4/V8Vqp2mMX5Q3mOCLuYZ
         wf69TsH+QmXpp8bOq7gMNnueVHkut1Vv5loYuZaRKOPBX/VQ1NuqAG/f14rvgX4Lp/ey
         CNQwYAbgce9WFIwV4YwEiRikjisxnoUKOb+nOF/MvW6uACTAa8OfuglS52dNQFALyfeu
         cWFw==
X-Gm-Message-State: ANoB5plQ1twnYPBySCoI/SCS50P1KhEF9eGAD7JzS6oObxz/WYWYWzRA
        /cceZpeM1MZViu+do3m5OrhT+d/4tq+cTo6xwVYMUw==
X-Google-Smtp-Source: AA0mqf6/eVAVisc1hbm0Yj8ZOwejQK740HqEyRqpyjbKLJ3Ao2/PvME3dZz7DhXm844HFeBMJnXmTTjlKBquRY2pKyU=
X-Received: by 2002:a9f:3588:0:b0:418:7beb:6f42 with SMTP id
 t8-20020a9f3588000000b004187beb6f42mr31042141uad.92.1669885837721; Thu, 01
 Dec 2022 01:10:37 -0800 (PST)
MIME-Version: 1.0
References: <20221123053512.1195309-1-mranostay@ti.com> <20221123053512.1195309-5-mranostay@ti.com>
In-Reply-To: <20221123053512.1195309-5-mranostay@ti.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 1 Dec 2022 10:10:26 +0100
Message-ID: <CAMRc=MdsV--24aPcE2ng-G=8z6yH14LQf9StcC_m5_58rHo88w@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] gpio: gpio-tps6594: add GPIO support for TPS6594 PMIC
To:     Matt Ranostay <mranostay@ti.com>
Cc:     michael@walle.cc, vigneshr@ti.com, robh@kernel.org,
        krzysztof.kozlowski@linaro.org, a.zummo@towertech.it,
        linus.walleij@linaro.org, lee@kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, Nov 23, 2022 at 6:35 AM Matt Ranostay <mranostay@ti.com> wrote:
>
> Add support for TPS6594 PMICs GPIO interface that has 11 that can be
> configured as input or outputs.
>
> Signed-off-by: Matt Ranostay <mranostay@ti.com>
> ---

I think you forgot to collect Linus' and my review tags.

Bart
