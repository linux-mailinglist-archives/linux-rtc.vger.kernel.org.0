Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2E4D69EA63
	for <lists+linux-rtc@lfdr.de>; Tue, 21 Feb 2023 23:45:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229769AbjBUWpb (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 21 Feb 2023 17:45:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229736AbjBUWpa (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 21 Feb 2023 17:45:30 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FAAD25E2A;
        Tue, 21 Feb 2023 14:45:28 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id b14-20020a17090a8c8e00b002349579949aso6279619pjo.5;
        Tue, 21 Feb 2023 14:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d8yMR/8v8kLbSK0SIiq6XLzEpqqLWV7XeR4dfqEeifw=;
        b=SfToj7YSKp2pMB+XPjKAkujyzH958pD9nwk9VeGexkEzIdDGtgjjV0OrTliX4VkVC6
         MKWYUvtiIhujHQ1UNpQmRQzEskN9NEZmNkFhuSEj632GYY57mvT4Zcus9SHwYHKchcVs
         uim8vH6u8exrN7mdBFl8EdaYc6eFbvqdE0wVN5sekUcLMxmqvIEZoShhSxHmLpSZrq7y
         MZQXPL2S7HXlQVvLWRpZBIZatxBr7KtMYibXmGcHkTuwESELvH5J411eYCYxanSZfGeX
         u8mVtH2FCD2GijmdT2sBq96dF7B0iZulQqct00OLE+pyIUWSHgV4RGosAXJatrUBfB9E
         Ffog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d8yMR/8v8kLbSK0SIiq6XLzEpqqLWV7XeR4dfqEeifw=;
        b=NSgyGqXMOje8RY6H8qOhCXbk97P7bkhRzuNgTaHk2nYxiwjUAbGy3oyGDYs+vv4gqc
         Mwhpbpd74sQNTSLSjQmfSPo5WxQXI7MVfUovc3YL6rSRYc9A9n1IFiMt/ydzqTYYxYbQ
         Bj7yszX9PsvylQs0MW84iB6OM4R6fOvt/0BJQ0fQICVEWb7hpTankpDYUQ4udPoaAkSU
         igNDJqaZ3ddXpQs7BUIeFAPhizESs0jRgP+KcY35qiSCzl0BLD1RDHZx8QEZbtWUu6YB
         pZOv3BxBTnY0OMmyK3HWQ81LClWK6kzZdJh1Rv2avnoQUwGiiVy+wn+YQ8zvPv+XunaK
         xfmw==
X-Gm-Message-State: AO0yUKW0jfive/O/bv+bW+VMsw6VRQNcCZBWHWj/Zk08f61/BCwQ08ki
        lxEWlAZluW5Diy3RevEoPj8=
X-Google-Smtp-Source: AK7set/weRvTdX3jDF1S3RU3H+Bmj2cbG/0SPhLrWXlqDTORq4JLJ7A2NFXInfm6UCuQsIvQHtUtyw==
X-Received: by 2002:a17:902:d2ce:b0:19b:3b4:3aee with SMTP id n14-20020a170902d2ce00b0019b03b43aeemr7641513plc.49.1677019527698;
        Tue, 21 Feb 2023 14:45:27 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:30ba:90e9:a2f2:4b50])
        by smtp.gmail.com with ESMTPSA id ij8-20020a170902ab4800b0019607aeda8bsm4031360plb.73.2023.02.21.14.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 14:45:27 -0800 (PST)
Date:   Tue, 21 Feb 2023 14:45:23 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jacky Bai <ping.bai@nxp.com>
Cc:     lee@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        linux-rtc@vger.kernel.org, kernel@pengutronix.de,
        linux-imx@nxp.com, festevam@gmail.com
Subject: Re: [PATCH v5 1/3] input: bbnsm_pwrkey: Add bbnsm power key support
Message-ID: <Y/VJgxb9k+zU1hqM@google.com>
References: <20230215024117.3357341-1-ping.bai@nxp.com>
 <20230215024117.3357341-2-ping.bai@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230215024117.3357341-2-ping.bai@nxp.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, Feb 15, 2023 at 10:41:15AM +0800, Jacky Bai wrote:
> The ON/OFF logic inside the BBNSM allows for connecting directly
> into a PMIC or other voltage regulator device. The module has an
> button input signal and a wakeup request input signal. It also
> has two interrupts (set_pwr_off_irq and set_pwr_on_irq) and an
> active-low PMIC enable (pmic_en_b) output.
> 
> Add the power key support for the ON/OFF button function found in
> BBNSM module.
> 
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>

Applied with a few cosmetic changes, thank you.

-- 
Dmitry
