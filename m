Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2089344CF2A
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Nov 2021 02:44:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232159AbhKKBqu (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 10 Nov 2021 20:46:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231312AbhKKBqt (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 10 Nov 2021 20:46:49 -0500
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A23F8C061766
        for <linux-rtc@vger.kernel.org>; Wed, 10 Nov 2021 17:44:01 -0800 (PST)
Received: by mail-qk1-x730.google.com with SMTP id de30so4451093qkb.0
        for <linux-rtc@vger.kernel.org>; Wed, 10 Nov 2021 17:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20210112.gappssmtp.com; s=20210112;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=oU1FX+KtL0dvDjjQJ9nWDVdtp5ZZvjw+0RWkBYg3pYQ=;
        b=VhTYj7tveAAJH2M9ps1Ta/CUXWxXCAuy2sDPW7rbveFKkCEL9F9ijK4Gk0Xntm0TfB
         J2bupc8amGV+b8llfdkkLbkdeMK+0O62QeA5nDgUksr42unWXiKTIhM5D0zV5cbdI8OP
         cc4H1CGLcN2t/LN6T9qZo6EfhVk29Kd36HJvtG/GaIFy0a9fDk1Ni2g6+evMMLHhspvk
         2VoARNVqV9mzSWlKgwFQOltw4BkJNoQoMRq/nsrEKwkafW4DjiJpkdV6h7DeucTzi0Rn
         OiRQKbAXtrNY0WigN77cnOAjjW03SvUduWDgAwjzW0BXFPeGzTQuM/E1djXDIc4Q2ja6
         aTYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=oU1FX+KtL0dvDjjQJ9nWDVdtp5ZZvjw+0RWkBYg3pYQ=;
        b=MlSHw8SFdFsR9bvCKzX0FcRqoLMQOXVH+dpqqpLz5MUbcc0yg+SpwPUqlQClUJd0YF
         xiewh4ujI35kL5zE8l01lfl9h+xqt/YLll7ZqmV8EwZ0ckl1wTG2x40lu59Pt+njOHs8
         y3XsF9gOKZWBNMenbf+FAg9rXuIop5f7Etk/NNkWRkwCMde3X8CKPp3f7NxL19KCl8Pf
         6ZVipffnvfxI0GDuXdFXWxwtEdtXevEzsBdclX1JXbTV82EVmSp1BVsblG5LAXXeX3Pi
         Jzroveza/ObX97/QQ+3C1yw5F6zgEm1n18eXdk2GNtIz/P73y9XDw90tn5otch2eESon
         cHLA==
X-Gm-Message-State: AOAM530ttpg6F0vMv78Evvh7wRYs7dW//u+/pqj1/yVTcasW3yhPIAi3
        Kg4JrT5mqeMUw+onrJkOq+k8WIIybGha+n2t
X-Google-Smtp-Source: ABdhPJyU7NBlCq/CkfnnCTaZPqdnlSzzXD7gR0isnizA/YXLk3OOilnF3TZSZk+P9SFE3Q4qiAdpnw==
X-Received: by 2002:a05:620a:4612:: with SMTP id br18mr3188567qkb.365.1636595040651;
        Wed, 10 Nov 2021 17:44:00 -0800 (PST)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com. [209.85.219.45])
        by smtp.gmail.com with ESMTPSA id y21sm858115qtw.10.2021.11.10.17.44.00
        for <linux-rtc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Nov 2021 17:44:00 -0800 (PST)
From:   Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qv1-f45.google.com with SMTP id d6so3127729qvb.3
        for <linux-rtc@vger.kernel.org>; Wed, 10 Nov 2021 17:44:00 -0800 (PST)
X-Received: by 2002:a05:6214:1c8a:: with SMTP id ib10mr3518401qvb.46.1636595040054;
 Wed, 10 Nov 2021 17:44:00 -0800 (PST)
MIME-Version: 1.0
References: <20211110132946.514825-1-festevam@gmail.com> <20211110132946.514825-2-festevam@gmail.com>
In-Reply-To: <20211110132946.514825-2-festevam@gmail.com>
Date:   Wed, 10 Nov 2021 22:43:48 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqBMBVEuhF4pwbm0pd7JbEPF69ERTm_y0CjspmgKZyAEw@mail.gmail.com>
Message-ID: <CAP9ODKqBMBVEuhF4pwbm0pd7JbEPF69ERTm_y0CjspmgKZyAEw@mail.gmail.com>
Subject: Re: [PATCH 2/2] rtc: rv8803: Add support for the Epson RX8804 RTC
To:     Fabio Estevam <festevam@gmail.com>
Cc:     alexandre.belloni@bootlin.com, linux-rtc@vger.kernel.org,
        Otavio Salvador <otavio@ossystems.com.br>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Em qua., 10 de nov. de 2021 =C3=A0s 10:29, Fabio Estevam
<festevam@gmail.com> escreveu:
>
> The Epson RX8804 RTC has the same programming model as RV8803.
>
> Add support for it in the driver.
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>
