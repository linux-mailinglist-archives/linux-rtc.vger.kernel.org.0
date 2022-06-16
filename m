Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6379254E650
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Jun 2022 17:44:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237819AbiFPPo4 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 16 Jun 2022 11:44:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377192AbiFPPoy (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 16 Jun 2022 11:44:54 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCC643915A;
        Thu, 16 Jun 2022 08:44:53 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id z9so995156wmf.3;
        Thu, 16 Jun 2022 08:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=LdO1jA+kjIuCFDgF/lBd3rE/LAuQRiZrmhG2Rh/eH+s=;
        b=I9C1B62CdmVZO2FqBSt636A7hAfIAhhxQpQwCV6SKj/Ou9BSzMN9XCpV7c0+e0uxSp
         Und5+6q/0f2a/rGb0KsFCF0JhGCwliRp/w1IjEEoS/yDFzCuRYADi7aeKxcfciCACBvN
         QNIEwfzb1zNevjuB3NOXBtQNOFtUitodTQ7saKXKFwYJONh6WS/iW0WZdU83py1mo0M4
         zDXpkECmTt7qpU4CnSfOFM0xKzZXTWufL/Gd+dBRAovUsqNm21SbjU8BbV67QE+hotds
         Tae7oQrru/bKr1EZ4PkCFZnpKSUBJWi29gich/7BBK5IIM+bG/0nqmiaAGXLLdxgr4Y7
         LxLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LdO1jA+kjIuCFDgF/lBd3rE/LAuQRiZrmhG2Rh/eH+s=;
        b=KIhrkFcTxVz4zThWckdnT6nNRuhi2rfW/Rp8e4YTBqZm0JnJrLBt+Zdg7zVLZZF64F
         NrwRJ2XtZO2iNqXDZAWj4wk7C0+Kd1x4XkuhxqrmZo5wUox39BfEnrBpw+miocHgLAhX
         YhJ3ZOLxV51JZqGDwUMGg+wL2F/0eQ/rKHue7tmbpJ+wyRfm8s2ilYhBPf1WOKE1ripD
         NcRXfp+YRzO9vjGqgWVoMdz8XxLgh+rjmAftNQQrQkINXTbQ/CpXXzuaR7ppRCZgtYo4
         qSN5VYlDIgF+WzpwAhBM+F99HXSIKBhFtvVlEhko+wxVaw5FozDu3zlytYUq0Erx9RHa
         axsQ==
X-Gm-Message-State: AOAM532Wz91QOv7wpeuj5eDeh1yGusc83Ib3nYsUB5ikuyDIc9QHFIgj
        WupYgESBOtcqVcEjbqOtlS45rGZtj7Q=
X-Google-Smtp-Source: ABdhPJzlHjaTzbZeifLXGqKa4uypDsJ5eQjTPda7O5Az28YJoiue39hy3vvQ1xx1OSt274FEtSK+/A==
X-Received: by 2002:a7b:c777:0:b0:39c:4e1d:fd27 with SMTP id x23-20020a7bc777000000b0039c4e1dfd27mr15976172wmk.1.1655394292170;
        Thu, 16 Jun 2022 08:44:52 -0700 (PDT)
Received: from orome (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id bv5-20020a0560001f0500b0020c5253d8casm2151977wrb.22.2022.06.16.08.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 08:44:51 -0700 (PDT)
Date:   Thu, 16 Jun 2022 17:44:49 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: rtc: ds1307: Convert to json-schema
Message-ID: <YqtP8fxV7w/o261y@orome>
References: <20211217170311.2796798-1-thierry.reding@gmail.com>
 <CAL_JsqLSJS_AThMfDOiZ2txC4K=9WCYEKw2TVzEM+tSD2W2qGA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Bx0DaXeyyhlubXwl"
Content-Disposition: inline
In-Reply-To: <CAL_JsqLSJS_AThMfDOiZ2txC4K=9WCYEKw2TVzEM+tSD2W2qGA@mail.gmail.com>
User-Agent: Mutt/2.2.4 (c3baa83e) (2022-04-30)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--Bx0DaXeyyhlubXwl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 10, 2022 at 05:09:41PM -0600, Rob Herring wrote:
> On Fri, Dec 17, 2021 at 10:03 AM Thierry Reding
> <thierry.reding@gmail.com> wrote:
> >
> > From: Thierry Reding <treding@nvidia.com>
> >
> > Convert the DS1307 (and compatible) RTC bindings from the free-form text
> > format to json-schema.
> >
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  .../devicetree/bindings/rtc/rtc-ds1307.txt    |  52 ---------
> >  .../devicetree/bindings/rtc/rtc-ds1307.yaml   | 104 ++++++++++++++++++
> >  2 files changed, 104 insertions(+), 52 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/rtc/rtc-ds1307.txt
> >  create mode 100644 Documentation/devicetree/bindings/rtc/rtc-ds1307.ya=
ml
>=20
> Was about to convert this one, too. Are you going to respin it?

Yeah, I can do that.

Thierry

--Bx0DaXeyyhlubXwl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmKrT/EACgkQ3SOs138+
s6FE4Q/9E6j+7I1CLR5kmGZixZRQ/mKVdJel9uf/ZNvpYY7xmZyH0T0z4M81nn3j
x8hXVKPxNyEISfkYNlXHwwZA1+bqgJhCO4U8HUpc0q04qk3Uvp5IKjEqwE8froiM
HRsvaldSD53pRMzqNMyF85GogbyR8Sp8YG4qbu/PGB6NTbPDuzxc3r4czC8DmThS
vTOyAAK5lsUJdbMqaTXgt0V+kvfjev6kVj0J3F7ppsdjeGCzCsOsUmBnclZEpsZD
733hWQnly+V2Lv43lc3Pi5oefEVAZaF4PCaD1XSeHovQjg4np+RQGquVIWBANkqq
Sbu6qXc6M0+D9JVvRyGNZ2/aBK3GS8r1yrrJzJVyaJkwUqqYr8x1v/RgHajyeB0I
5Q6dY60YBS4UgjxUREDG+Tx4dAswd5W+kionAnKPMrJPB5kQU1AvsTmv2PPz5CWm
oXnsfrTFh0ay5E/8RFV9a6JtHC4PhZx9wdFMuCiGSoPw4uw8C5QQdcF4rKp/ZEUx
Bn0QJjSXNNyjafySGRXlv6Q6owJxHlyGXtZPMlYrG2mxEq3XeXN7qi68J9O5MrG1
fTeQ0o7A0cksKdBmC+wggfhZL6UuoNynEIwl4eGJkcOCq42VCGOCjpYs8KDrB5Lf
wJnECdiqU52PlUmn6MAcGTQE7FEVZOvfl2oRI4Agj3ebEsmlgdo=
=5a3H
-----END PGP SIGNATURE-----

--Bx0DaXeyyhlubXwl--
