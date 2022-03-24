Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 718344E5FB8
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Mar 2022 08:51:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242403AbiCXHx1 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 24 Mar 2022 03:53:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348731AbiCXHx1 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 24 Mar 2022 03:53:27 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1570D996A4
        for <linux-rtc@vger.kernel.org>; Thu, 24 Mar 2022 00:51:56 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id j13so3905501plj.8
        for <linux-rtc@vger.kernel.org>; Thu, 24 Mar 2022 00:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=pu00Wt7t+7SgrwxKX6S64r5ey3zhRw/tKWIDbQLLHnU=;
        b=ojF6jN6FPzADkF69NIviFCqlkD0B5s441uEag3GAlD40cW4lJZVW2AqzYcQVI6fvJc
         y2oIi8eL/PQ2Ejk4dqdKliziyz7uSG/7umM0DEBK5fXajegRM+21US1YIWRo0T+3DLjI
         cR+GXdjtiO5en7xywf1rnm9Q5O+aOIrOZS0MUvBfpAhQ7kmi5hmfBt6iYAS+iY+QfEu6
         5Np87P5log4ZGrmJ2NnRPitBEFyCah7+4bvdN6efEleE5bxEO+JCAHbTtkFyu8/8+SSk
         bVaxR33bblL26CnTmxIWZCxQoImPHtF7RiIOnZMU87oN5DL5AGx3DW+6Sw7cApMjRD6C
         1NXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=pu00Wt7t+7SgrwxKX6S64r5ey3zhRw/tKWIDbQLLHnU=;
        b=Jt7Qdk4VdsouvPrAzBETNmEryFNcRki642DRDP1GU7f7HsGCUcxU0YV+w4mxPV/1ms
         6MDS+XBQf121Jbx7RH2J5F63jDaUIDcKgHKd1OiT+g/jJRNTOCT9CrqMw6k49pUWqKFq
         h5BmUZEb/ISjsLKPx3PHQEX7lZ57wRzcTpyEFuof2ic3xgqYkZfuYbGwM92iUk4Vcjl6
         KeD45eorKnz4Fxu58gkMbrP46zrlVQ8PsBy97ine0tGw+C10QNk8MW+S5poWmd4GgBVe
         Xwj5X5QNyn+ANCRNhODt5npnFQZaknC1yYE6nAD/DROvDNuoTdpUi6pAdgBJE+6lvuwg
         Rb5Q==
X-Gm-Message-State: AOAM532xc3f7puq7806hOisOtGTPDXzilzl7/sThWj8T9zO1ZvFvYiYX
        STkpCss6JMxTjAQWankvPuloTUQ740z7Ha5EGELysg==
X-Google-Smtp-Source: ABdhPJwF9vUdTNhlcu7amXjm8S7YDp9GZJV7KKDCtR77DoilLycYmSpRd7n+ibYFvaziJGbJiudFQA4pb1OUAH8q6nc=
X-Received: by 2002:a17:90b:4c92:b0:1c7:a9a3:6274 with SMTP id
 my18-20020a17090b4c9200b001c7a9a36274mr5439038pjb.148.1648108315505; Thu, 24
 Mar 2022 00:51:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220308133505.471601-1-clement.leger@bootlin.com>
In-Reply-To: <20220308133505.471601-1-clement.leger@bootlin.com>
From:   Jens Wiklander <jens.wiklander@linaro.org>
Date:   Thu, 24 Mar 2022 08:51:44 +0100
Message-ID: <CAHUa44EVLYiA6u4QVyPQTnK0-=4UgL-RK4i=wDYfQW9daCCkvw@mail.gmail.com>
Subject: Re: [PATCH v4] rtc: optee: add RTC driver for OP-TEE RTC PTA
To:     =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org,
        Etienne Carriere <etienne.carriere@linaro.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, Mar 8, 2022 at 2:36 PM Cl=C3=A9ment L=C3=A9ger <clement.leger@bootl=
in.com> wrote:
>
> This drivers allows to communicate with a RTC PTA handled by OP-TEE [1].
> This PTA allows to query RTC information, set/get time and set/get
> offset depending on the supported features.
>
> [1] https://github.com/OP-TEE/optee_os/pull/5179
>
> Signed-off-by: Cl=C3=A9ment L=C3=A9ger <clement.leger@bootlin.com>
> ---
>
> Changes in v4:
>  - Remove error prints except the ones in probe
>
> Changes in v3 (was resent as a second v2 due to a mistake);
>  - Fix error messages to include ret value and fix wrong IOCTL names
>  - Use 100 columns char limit
>
> Changes in v2:
>  - Rebased over tee-shm-for-v5.18
>  - Switch to tee_shm_alloc_kernel_buf()
>  - Use export_uuid() to copy uuid
>  - Fix warnings reported by checkpatch
>  - Free SHM in error exit path
>
>  MAINTAINERS             |   6 +
>  drivers/rtc/Kconfig     |  10 ++
>  drivers/rtc/Makefile    |   1 +
>  drivers/rtc/rtc-optee.c | 362 ++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 379 insertions(+)
>  create mode 100644 drivers/rtc/rtc-optee.c

Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
