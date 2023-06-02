Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F30971FAF8
	for <lists+linux-rtc@lfdr.de>; Fri,  2 Jun 2023 09:29:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234071AbjFBH3J (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 2 Jun 2023 03:29:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234066AbjFBH3G (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 2 Jun 2023 03:29:06 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 250731A6
        for <linux-rtc@vger.kernel.org>; Fri,  2 Jun 2023 00:29:01 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-bacf9edc87bso1798998276.1
        for <linux-rtc@vger.kernel.org>; Fri, 02 Jun 2023 00:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685690940; x=1688282940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aH3Y/v9X186tzK7HzUlONQYSFI1OQUrukuDM46U+ZII=;
        b=RQkvrJrR90O9/4QwQTk1VD+v4lTSjCx9AQ0JIljEGQizj0G3/5YLlt32Kbo6EL7WOj
         t7rYi9bTxeTZ1pKP2ejd6MpD1YkHeX1k8JJFlmKRCNIbt+X6MdSna2I0ki8Vl3OFU8rp
         UZXQbhj1h3+CVf1uPWnrhRB5SWWwFlhKho+0h7zPB3yj2ZloJdiW61uzNMSSoKzTdxQ9
         Y5W+i1028Ge/7QEexXIjdFUNagZGv/BSqJjSGgINsoZwVSWFDjyOI2VmKm8LAyl89wa5
         HeofJEz4TfcmmVjQt964u3NxIyepANsDWsEkVRqcdmV09xpt7iqxAs0nSfatOmlljLUI
         aYXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685690940; x=1688282940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aH3Y/v9X186tzK7HzUlONQYSFI1OQUrukuDM46U+ZII=;
        b=ks8U9A70DyKupbDtOPJlOLenQGfK7leYnwheaJnGBzJcIImPsqgvm0oT1rOqxVE07S
         peanW1u2JkatdvHLzZO13YjBI3HEqtnSBTEd/Hw0zNZK8HxLeWL21V/+1hpsroFXIaQ+
         jF8KdNrdXNEA5ZQLvr9sFqndBQpFlBrKItUQXwjeqYkhGR87e4eHjnfDUI9aPz2UJDkb
         AEHLcJ6C8MS3nl8pcrCqIX/66F0CB4JWiB02rQQ4tV6p11pYnn+pGN3KdGsewBti9l+j
         RcuKygsthoI+U1wqmNQ3PUAW2iNl4duZvH7JXlz5J8AriHQ4YUwPsiMzy5Ix7WmIGZ8m
         593Q==
X-Gm-Message-State: AC+VfDy74bCWfcfZ1aUXldAkc/rhk3KkhuINKBv71+e4/3P7+AbUnFjd
        okNNuGpjE2DCS8Z6QsFO8Zok//0SOR4wTgK5JsUxFA==
X-Google-Smtp-Source: ACHHUZ4P26QRg0z3Cp5tAgnpxQzmaTfUlISKw09WuNlC/KVQGCy4zcdSJEIg+FXUI0dElFNofz56XRiMqxyVNo+1brI=
X-Received: by 2002:a81:7105:0:b0:568:fe3a:46a2 with SMTP id
 m5-20020a817105000000b00568fe3a46a2mr6198973ywc.18.1685690940408; Fri, 02 Jun
 2023 00:29:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230424123522.18302-1-nikita.shubin@maquefel.me> <20230601054549.10843-12-nikita.shubin@maquefel.me>
In-Reply-To: <20230601054549.10843-12-nikita.shubin@maquefel.me>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 2 Jun 2023 09:28:49 +0200
Message-ID: <CACRpkdZ18Yct5PAk+vuJaSV1j4XU9y9K2FTc=X-UM9JBLz-EZQ@mail.gmail.com>
Subject: Re: [PATCH v1 30/43] rtc: m48t86: add DT support for m48t86
To:     Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Michael Peters <mpeters@embeddedts.com>,
        Kris Bahnsen <kris@embeddedts.com>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, Jun 1, 2023 at 7:46=E2=80=AFAM Nikita Shubin <nikita.shubin@maquefe=
l.me> wrote:

> - get regs from device tree
>
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
