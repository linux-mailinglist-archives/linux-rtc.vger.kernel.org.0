Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24EC46AE0A6
	for <lists+linux-rtc@lfdr.de>; Tue,  7 Mar 2023 14:35:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229720AbjCGNfg (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 7 Mar 2023 08:35:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229593AbjCGNff (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 7 Mar 2023 08:35:35 -0500
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6372B5BC90
        for <linux-rtc@vger.kernel.org>; Tue,  7 Mar 2023 05:35:34 -0800 (PST)
Received: by mail-yb1-xb35.google.com with SMTP id v101so11392581ybi.2
        for <linux-rtc@vger.kernel.org>; Tue, 07 Mar 2023 05:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678196133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SuoCQcOuTdpcxwFMyiCQRw8MwyW1RKCTWVLX8zDnBP8=;
        b=x0CH/mqY8dQEWykIgObYl4BegwE2o74N8Nk+1P7/eQhq2D1ePD9gL9y5rIe5n0u4XH
         z9Mpv7s1zCpvREvjx/fI3vDaln2qv0mk3Ogc8qZGT2xIbGM5nkVyz3giM20+ZKmCqo+f
         al4w9EOA9xamoMDZoI6ZEEDCqdkXfcLrl3N632W8UH+sXDUjAsV5qZ2pS+51acvTrbUA
         Whg4irETQi+VLcu1gQWWMm5fhI23S4pxN0xw+bKOUNgNnlGz2q6UojaiS6OTaJt6HAP/
         /FIzFg+EgixuvYuTZwCoZDUuB2iskYQ4jrktefiS4UF/lWYc36YfpwZA7pW/DXD6Eln+
         ol5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678196133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SuoCQcOuTdpcxwFMyiCQRw8MwyW1RKCTWVLX8zDnBP8=;
        b=flYtnSnslz9/3ZOGXI3acw6dA6m1uPY8U4Ny0csZZgGcLFcJ+D/PY+WztH7wr5n2Ht
         P6QdRS8SaurMFTbZvzVjsh7A/xd2KgzDw7Iy2Z1l4PtqMNab4unOzjym6R3Y4DoM7QT/
         iLZ31eMBVUC2QqoUEMc+Pm1WCcFg3zBN8lfyKxoY/cZzHxJJVAJyE/+tpqU6YHv/uZnW
         ZsCXFRmGPDSVa92k8lAwQopHipPW1DXkuNhPWvkNzZJ8/meaUgBOI66eYAqXg7WOcLtU
         CfCQMjZM5apb1heG0ZLJfeP4ULw17UY4Zg19NuAo73HWs3TbCzb7qzgZvJ1u8IrI2TZh
         5ifw==
X-Gm-Message-State: AO0yUKXAl8QvjNQp70SYgTmtMtWaajueoMqJfoluo6eNNVKmdWIDLgzv
        8aK4w/rwVbTkGdizbDOVmsNMM8gkoEqPmtbdhWPXqA==
X-Google-Smtp-Source: AK7set+DpX86VGcKmGJrgdwMb8omqcOHYp7TY4T6JIsWaxpwGJDK6A0wL6l9j/Rc/exm4oNI3BiFr/U8b1pQ2V8seDI=
X-Received: by 2002:a05:6902:4f4:b0:a06:5ef5:3a82 with SMTP id
 w20-20020a05690204f400b00a065ef53a82mr6798249ybs.5.1678196133303; Tue, 07 Mar
 2023 05:35:33 -0800 (PST)
MIME-Version: 1.0
References: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de> <20230304133028.2135435-4-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230304133028.2135435-4-u.kleine-koenig@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Mar 2023 14:35:22 +0100
Message-ID: <CACRpkdZjV3ggmXvma68fT_uL4LK4vpib7e_tx+qVLwi3VPGkFA@mail.gmail.com>
Subject: Re: [PATCH 03/41] rtc: ab8500: Convert to platform remove callback
 returning void
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
        kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Sat, Mar 4, 2023 at 2:30 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:

> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
