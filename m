Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 106346AAA43
	for <lists+linux-rtc@lfdr.de>; Sat,  4 Mar 2023 14:47:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229445AbjCDNrY (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 4 Mar 2023 08:47:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjCDNrX (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 4 Mar 2023 08:47:23 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 768771C7CB
        for <linux-rtc@vger.kernel.org>; Sat,  4 Mar 2023 05:47:22 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 15B3B60C68
        for <linux-rtc@vger.kernel.org>; Sat,  4 Mar 2023 13:47:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB860C433D2;
        Sat,  4 Mar 2023 13:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677937641;
        bh=hWHUSaDzmJkG4Kw01uA2fHvq4b5Dkeyw+ai0+31vN7k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KJyocZw9zevswKyeH5CvQ6wQ3A3njdTvsBYTGfecp+dp8S6EWywj3q5yKLE2YLAzX
         M6mFHH8rNtuwreCsuJjOaZWWc8o7SsbfXEUdaPLOfNmKuCJAKvIuEVkOwpqHxn8grR
         +zU5glM8J7aRySbYmXtSCejP+KT4Ni6lAj9rsOcthK4J9m12It/QwY1L6o/466+4GE
         1I543usQKt0JMe/NIkn3q2Fz/SBytMuINC7rreNAoR3VpE9naWd4R1ElryKE37OQpq
         T/+vx0va7V14kasMHJntw+uBQPyc63Ab/o4W4yMv0vbUi6pWRpgFPKbnbPaynPFuza
         NAzcnG4Jb3r9A==
Date:   Sat, 4 Mar 2023 13:47:17 +0000
From:   Conor Dooley <conor@kernel.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Conor Dooley <conor.dooley@microchip.com>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 18/41] rtc: mpfs: Convert to platform remove callback
 returning void
Message-ID: <6c93ded7-f9ed-4f01-94ef-503900d5120a@spud>
References: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
 <20230304133028.2135435-19-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="RoEFS/lyAZPH8xif"
Content-Disposition: inline
In-Reply-To: <20230304133028.2135435-19-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--RoEFS/lyAZPH8xif
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 04, 2023 at 02:30:05PM +0100, Uwe Kleine-K=F6nig wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>=20
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  drivers/rtc/rtc-mpfs.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/rtc/rtc-mpfs.c b/drivers/rtc/rtc-mpfs.c
> index 2a479d44f198..5b96a6d39210 100644
> --- a/drivers/rtc/rtc-mpfs.c
> +++ b/drivers/rtc/rtc-mpfs.c
> @@ -274,11 +274,9 @@ static int mpfs_rtc_probe(struct platform_device *pd=
ev)
>  	return devm_rtc_register_device(rtcdev->rtc);
>  }
> =20
> -static int mpfs_rtc_remove(struct platform_device *pdev)
> +static void mpfs_rtc_remove(struct platform_device *pdev)
>  {
>  	dev_pm_clear_wake_irq(&pdev->dev);
> -
> -	return 0;
>  }
> =20
>  static const struct of_device_id mpfs_rtc_of_match[] =3D {
> @@ -290,7 +288,7 @@ MODULE_DEVICE_TABLE(of, mpfs_rtc_of_match);
> =20
>  static struct platform_driver mpfs_rtc_driver =3D {
>  	.probe =3D mpfs_rtc_probe,
> -	.remove =3D mpfs_rtc_remove,
> +	.remove_new =3D mpfs_rtc_remove,
>  	.driver	=3D {
>  		.name =3D "mpfs_rtc",
>  		.of_match_table =3D mpfs_rtc_of_match,
> --=20
> 2.39.1
>=20

--RoEFS/lyAZPH8xif
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZANL0wAKCRB4tDGHoIJi
0qHdAP9DvnqB21+PjqzdhHhJ5rh1fatkOprrWT06kKNyRI/GwAEAp0UG7za0+Re1
PDSwYAGYFNRzfiMA0QWNa7rYIhSFtw0=
=Syln
-----END PGP SIGNATURE-----

--RoEFS/lyAZPH8xif--
