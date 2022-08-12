Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1054F591116
	for <lists+linux-rtc@lfdr.de>; Fri, 12 Aug 2022 14:55:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238667AbiHLMzR (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 12 Aug 2022 08:55:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238721AbiHLMzO (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 12 Aug 2022 08:55:14 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E9ACE95
        for <linux-rtc@vger.kernel.org>; Fri, 12 Aug 2022 05:55:13 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id f65so707039pgc.12
        for <linux-rtc@vger.kernel.org>; Fri, 12 Aug 2022 05:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=VDtjYdN7YuCCQGXtkzjt2mpUoG4oHymLw4QsZRtpGcA=;
        b=ZtiRlWNWkaU6Z2PXLHlk7ssDMikKDrLfWic9VYlZ2oIT92okEaAuGOPtfI3BG4z/zv
         Y0BULC7cG0h8Uy5jqa0KizQK7v9HJxL3apfawcsDCmR0KeBp8NGeyASaLZ5kpG0pb2O5
         AtIMj9qxIDvTmv/5SnwCqBQZDEZJARqx41RkgRm8iirYcFxLtpQt04GAYEhGRQGyETEd
         0fO7r2QGf5XxFjXa3CiPHlHurY2r6Crf9BhwKZ/5TLQBJQCF8Hgdtk1k5ddLSQraCSfn
         HAFypiKWrrbT969zpXcZEVE5bFC8gFgQQxKMLR7JHIaeUOFe6IPlyZpvs+ITSi4JAWSc
         CxDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=VDtjYdN7YuCCQGXtkzjt2mpUoG4oHymLw4QsZRtpGcA=;
        b=1gCzdMwx4PV3uMggIJCZxGt8HE8bOCBhSH+69CqP1zL0ie9nmIqjHC3I9xBUWOs1pR
         YNWLMDTqq2/fRigzY5DZTBQhVyLGxEuf7/oBloztLIbwGjGU+fSKftLMAQx3JudaOZzb
         LoTor475fpEBFSfp0eBbIwIPMf5B8JTsA83dzhTI8uaWIRSu5l6+WhKF+oqDt1Wp4M0h
         tH66TA8KUVUptlD5LvoHkkHkbj/wU1xFlnj12oxlVC05xez45wCgAoXl+l5NQm8BE50N
         xXlAN/T5scmY/ElFgMSEkcb+2rbk/fqKz9Ead4sTGUSdLbEL9GFSk9o9eT3E9zOBd693
         vVPg==
X-Gm-Message-State: ACgBeo3XqA4YYnaz4A2wbCuw/HowNsEtlnlCx7yKmLEQox5BXHzYbRwF
        gSQS5dBjMwrY4Ge4Gx/oaN6en2wwCGDM8dqzaj0qNw==
X-Google-Smtp-Source: AA6agR6g/ED6xi1uJYMOVfwr91Ky1x6MgRmKOFDBj2xqQ4zFX5QIer8237YskBzHZ2KBjjdKP6b/EXeWMLs7/+N3zLo=
X-Received: by 2002:a05:6a00:1352:b0:52f:bc83:c93e with SMTP id
 k18-20020a056a00135200b0052fbc83c93emr3489635pfu.45.1660308912604; Fri, 12
 Aug 2022 05:55:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220812092901.6429-1-zhiyong.tao@mediatek.com>
 <20220812092901.6429-2-zhiyong.tao@mediatek.com> <cbe761af-5011-83a2-0509-2b3c4fe0a79c@linaro.org>
 <4a49b619deb5453749a47874377cad6a36a9a054.camel@mediatek.com>
In-Reply-To: <4a49b619deb5453749a47874377cad6a36a9a054.camel@mediatek.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date:   Fri, 12 Aug 2022 15:55:01 +0300
Message-ID: <CAGE=qrohYZ6f9bbEuYfF=2Rz21nbW_8ho3rBQmHt1D+kQG2-jA@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] regulator: dt-bindings: mediatek: add mt6366
To:     "zhiyong.tao" <zhiyong.tao@mediatek.com>
Cc:     lee.jones@linaro.org, robh+dt@kernel.org, matthias.bgg@gmail.com,
        lgirdwood@gmail.com, broonie@kernel.org, eddie.huang@mediatek.com,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        fshao@chromium.org, sen.chu@mediatek.com, hui.liu@mediatek.com,
        allen-kh.cheng@mediatek.com, hsin-hsiung.wang@mediatek.com,
        sean.wang@mediatek.com, macpaul.lin@mediatek.com,
        wen.su@mediatek.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, 12 Aug 2022 at 15:52, zhiyong.tao <zhiyong.tao@mediatek.com> wrote:
>
> On Fri, 2022-08-12 at 13:55 +0300, Krzysztof Kozlowski wrote:
> > On 12/08/2022 12:29, Zhiyong Tao wrote:
> > > Add mt6366 regulator document
> > >
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: mediatek,mt6366-regulator
> > > +
> > > +  regulators:
> > > +    type: object
> > > +    description: List of regulators and its properties
> > > +
> > > +    patternProperties:
> > > +      "^buck-
> > > v(dram1|core|coresshub|proc11|proc12|gpu|s2|modem|s1)$":
> > > +        type: object
> > > +        $ref: regulator.yaml#
> > > +        unevaluatedProperties: false
> > > +
> > > +      "^ldo-v(dram2|sim1|ibr|rf12|usb|camio|camd|cn18|fe28)$":
> > > +        type: object
> > > +        $ref: regulator.yaml#
> >
> > You miss unevaluatedProperties in most of the places.
>
> Hi Krzysztof,
>    Thanks for your suggestion,
>    Do you mean that all places should have the unevaluatedProperties
> Properties ?

Yes. You put it in some of the places which does not really make sense...

Best regards,
Krzysztof
