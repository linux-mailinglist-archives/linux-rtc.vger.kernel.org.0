Return-Path: <linux-rtc+bounces-3091-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35635A270B2
	for <lists+linux-rtc@lfdr.de>; Tue,  4 Feb 2025 12:55:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B27AF3A448D
	for <lists+linux-rtc@lfdr.de>; Tue,  4 Feb 2025 11:54:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1D4920CCF0;
	Tue,  4 Feb 2025 11:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mvista.com header.i=@mvista.com header.b="UUEXmua9"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C43020B80B
	for <linux-rtc@vger.kernel.org>; Tue,  4 Feb 2025 11:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738670097; cv=none; b=Lipbrx7ipexVdHotHwGdz+PoxXz3ote+OZ21eUN8k+1UJqjoUXpBW+gOYNP/gefvpyIdHRR+Lhs0fywnuojJFpIwnN4Yqf9CfJP8//wHNTLHOsKE+Y8jh1enDIzr3rN5bh4Igyk2BJBGTJT71vBCrMsOVR/VNbm/4uY9dtS/fHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738670097; c=relaxed/simple;
	bh=gN8uLsdzeSsXSL7kpsAZMwgBCfr8q4BlE+QuWDtkcyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PLsLiP1WFUkt36tFNdU1h1CfdeaSZoLCj67XvgCoaacSV6J/i++uAAvwyTyIvogo3VJm7+yMlRTtjG9VokGPhljWT9e7QnjwWQU3ewgQr/LxC6vuVDW3yuOUimhdWDARivMNZMSIxB1vU+wOZhvtD0eVW03foi852b8F+tVMjrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mvista.com; spf=pass smtp.mailfrom=mvista.com; dkim=pass (1024-bit key) header.d=mvista.com header.i=@mvista.com header.b=UUEXmua9; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mvista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mvista.com
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-2b7f9158b97so35796fac.2
        for <linux-rtc@vger.kernel.org>; Tue, 04 Feb 2025 03:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1738670094; x=1739274894; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1L0BL/nrOB6bJoIutGy5QWRMc/IyHgOeg0ezRUYTs1Q=;
        b=UUEXmua9PPR3w+Nc4fb8/gOpyrKKoYetXFiX5omFmYMgMZMqsX0kR2guaOlNosZYcQ
         97+/BEhFdKOqc+apDKH8lsEh4ZFTZEsviofrkMN8Jg3cTMwGRpWcP92EFHUStsvMiJWC
         WZCOkm/YNZ+JavYCvelJCIqotwAFcDR553a1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738670094; x=1739274894;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1L0BL/nrOB6bJoIutGy5QWRMc/IyHgOeg0ezRUYTs1Q=;
        b=veZ8L3xiMQReXEKKM+6vOVy1ARePIgv9hMGoOzduLddR9T6pG8h0gHICsWs5bCi9yO
         jXYH/i6D4MwOhR9kC4EC4AVdQPRF276OknBSoKhfZx0d8OKZ7Iz2k0sLq1gLiSjl8QZ5
         fXlaaukq81yLkgif2cZXqdnkgbVbowo0jiRgMKdMgPPtPKqXQhILpjmx3MtZC4cpykmn
         7y/GVQMO4EpheRgP5fIPVMCn82/LASXKuwGadSMo2aXHPcDQQQLEC15sRhzeCND3YL4Y
         y2U2hs5VjkHRRROqxl5xnxVpol2oGL7HZfrFWckW9M6zGnNwWZPDIe6sBDZ2vm2YVace
         rxtQ==
X-Gm-Message-State: AOJu0YyWnk/DRKhnBAlyg4shXxKkY0RtFzoYUCvu8p1xbGaRyeczE/5S
	/Jq7H72cYIIR2wizm0wD8wCFdnadzeEoMPb53tLhOQmIkr/i1aIlUel5yHrsLe6SXHQI46U0oun
	i
X-Gm-Gg: ASbGncuckh3qd1XYY5XlYJk4+/8HjpUUTRz+wkbQEJQOGphAcBJoCfp6phsfnbDpPBd
	jSXJxfz3pdbp/s4y5YMZDC7jwSd5LvMOQl5UkOpCRC8OPdg8kaxKBdHtyUX0r/hZw9saa5HOuUI
	mv+f1NmHs9GUBxKsrPZcZKITSERamOdYpcLRGaN84eHLrkl/5TiU6UbvAku/v2VZ9rcC5OCWrUY
	ToO2p2tieFx9uGoikqneky1Xe8RDJEJb+311LXgU7i7TJJzr/cwtpJ1JEh6K2RmJ24STGH8AtYT
	8fphZX6TVjGj62Suo+AUUg==
X-Google-Smtp-Source: AGHT+IHFiKlP3BxWP1ApNivVAqnzXxNvo/2u3jufuFz2PjTqZ/0Df3DXs6WWfU9qmN1LyjjDe7nhpQ==
X-Received: by 2002:a05:6870:7d09:b0:29e:290f:7aea with SMTP id 586e51a60fabf-2b32f2e93c7mr16657612fac.34.1738670093598;
        Tue, 04 Feb 2025 03:54:53 -0800 (PST)
Received: from mail.minyard.net ([2001:470:b8f6:1b:ec53:8290:86a1:aa7c])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2b3566690f6sm3918860fac.49.2025.02.04.03.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 03:54:51 -0800 (PST)
Date: Tue, 4 Feb 2025 05:54:49 -0600
From: Corey Minyard <cminyard@mvista.com>
To: Alexander Bigga <ab@mycable.de>, alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	nmydeen@mvista.com
Subject: Re: [PATCH] rtc-m41t62: kickstart ocillator upon failure
Message-ID: <Z6IACQ8fx-EuooD9@mail.minyard.net>
Reply-To: cminyard@mvista.com
References: <20250116062641.366679-1-nmydeen@mvista.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha-256; boundary="ziNpAt5qh7l7+s0D"
Content-Disposition: inline
In-Reply-To: <20250116062641.366679-1-nmydeen@mvista.com>


--ziNpAt5qh7l7+s0D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Adding Alexander

On Thu, Jan 16, 2025 at 11:56:41AM +0530, nmydeen@mvista.com wrote:
> From: "A. Niyas Ahamed Mydeen" <nmydeen@mvista.com>
>=20
> The ocillator on the m41t62 (and other chips of this type) needs
> a kickstart upon a failure; the RTC read routine will notice the
> oscillator failure and fail reads.  This is added in the RTC write
> routine; this allows the system to know that the time in the RTC
> is accurate.  This is following the procedure described in section
> 3.11 of  "https://www.st.com/resource/en/datasheet/m41t62.pdf"

Any comments on this?  I just saw that Alexander wasn't on the email,
not sure if they are still involved.

-corey

>=20
> Signed-off-by: A. Niyas Ahamed Mydeen <nmydeen@mvista.com>
> Reviewed-by: Corey Minyard <cminyard@mvista.com>
> ---
>  drivers/rtc/rtc-m41t80.c | 70 ++++++++++++++++++++++++++++------------
>  1 file changed, 49 insertions(+), 21 deletions(-)
>=20
> diff --git a/drivers/rtc/rtc-m41t80.c b/drivers/rtc/rtc-m41t80.c
> index 1f58ae8b151e..77c21c91bae3 100644
> --- a/drivers/rtc/rtc-m41t80.c
> +++ b/drivers/rtc/rtc-m41t80.c
> @@ -22,6 +22,7 @@
>  #include <linux/slab.h>
>  #include <linux/mutex.h>
>  #include <linux/string.h>
> +#include <linux/delay.h>
>  #ifdef CONFIG_RTC_DRV_M41T80_WDT
>  #include <linux/fs.h>
>  #include <linux/ioctl.h>
> @@ -204,7 +205,7 @@ static int m41t80_rtc_read_time(struct device *dev, s=
truct rtc_time *tm)
>  		return flags;
> =20
>  	if (flags & M41T80_FLAGS_OF) {
> -		dev_err(&client->dev, "Oscillator failure, data is invalid.\n");
> +		dev_err(&client->dev, "Oscillator failure, time may not be accurate, w=
rite time to RTC to fix it.\n");
>  		return -EINVAL;
>  	}
> =20
> @@ -227,21 +228,60 @@ static int m41t80_rtc_read_time(struct device *dev,=
 struct rtc_time *tm)
>  	return 0;
>  }
> =20
> -static int m41t80_rtc_set_time(struct device *dev, struct rtc_time *tm)
> +static int m41t80_rtc_set_time(struct device *dev, struct rtc_time *in_t=
m)
>  {
>  	struct i2c_client *client =3D to_i2c_client(dev);
>  	struct m41t80_data *clientdata =3D i2c_get_clientdata(client);
> +	struct rtc_time tm =3D *in_tm;
>  	unsigned char buf[8];
>  	int err, flags;
> +	time64_t time =3D 0;
> =20
> +	flags =3D i2c_smbus_read_byte_data(client, M41T80_REG_FLAGS);
> +	if (flags < 0)
> +		return flags;
> +	if (flags & M41T80_FLAGS_OF) {
> +		/* OF cannot be immediately reset: oscillator has to be restarted. */
> +		dev_warn(&client->dev, "OF bit is still set, kickstarting clock.\n");
> +		err =3D i2c_smbus_write_byte_data(client, M41T80_REG_SEC, M41T80_SEC_S=
T);
> +		if (err < 0) {
> +			dev_err(&client->dev, "Can't set ST bit\n");
> +			return err;
> +		}
> +		err =3D i2c_smbus_write_byte_data(client, M41T80_REG_SEC,
> +						    flags & ~M41T80_SEC_ST);
> +		if (err < 0) {
> +			dev_err(&client->dev, "Can't clear ST bit\n");
> +			return err;
> +		}
> +		/* oscillator must run for 4sec before we attempt to reset OF bit */
> +		msleep(4000);
> +		/* Clear the OF bit of Flags Register */
> +		err =3D i2c_smbus_write_byte_data(client, M41T80_REG_FLAGS,
> +					flags & ~M41T80_FLAGS_OF);
> +		if (err < 0) {
> +			dev_err(&client->dev, "Unable to write flags register\n");
> +			return err;
> +		}
> +		flags =3D i2c_smbus_read_byte_data(client, M41T80_REG_FLAGS);
> +		if (flags < 0)
> +			return flags;
> +		else if (flags & M41T80_FLAGS_OF) {
> +			dev_err(&client->dev, "Can't clear the OF bit check battery\n");
> +			return err;
> +		}
> +		/* add 4sec of oscillator stablize time otherwise we are behind 4sec */
> +		time =3D rtc_tm_to_time64(&tm);
> +		rtc_time64_to_tm(time+4, &tm);
> +	}
>  	buf[M41T80_REG_SSEC] =3D 0;
> -	buf[M41T80_REG_SEC] =3D bin2bcd(tm->tm_sec);
> -	buf[M41T80_REG_MIN] =3D bin2bcd(tm->tm_min);
> -	buf[M41T80_REG_HOUR] =3D bin2bcd(tm->tm_hour);
> -	buf[M41T80_REG_DAY] =3D bin2bcd(tm->tm_mday);
> -	buf[M41T80_REG_MON] =3D bin2bcd(tm->tm_mon + 1);
> -	buf[M41T80_REG_YEAR] =3D bin2bcd(tm->tm_year - 100);
> -	buf[M41T80_REG_WDAY] =3D tm->tm_wday;
> +	buf[M41T80_REG_SEC] =3D bin2bcd(tm.tm_sec);
> +	buf[M41T80_REG_MIN] =3D bin2bcd(tm.tm_min);
> +	buf[M41T80_REG_HOUR] =3D bin2bcd(tm.tm_hour);
> +	buf[M41T80_REG_DAY] =3D bin2bcd(tm.tm_mday);
> +	buf[M41T80_REG_MON] =3D bin2bcd(tm.tm_mon + 1);
> +	buf[M41T80_REG_YEAR] =3D bin2bcd(tm.tm_year - 100);
> +	buf[M41T80_REG_WDAY] =3D tm.tm_wday;
> =20
>  	/* If the square wave output is controlled in the weekday register */
>  	if (clientdata->features & M41T80_FEATURE_SQ_ALT) {
> @@ -261,18 +301,6 @@ static int m41t80_rtc_set_time(struct device *dev, s=
truct rtc_time *tm)
>  		return err;
>  	}
> =20
> -	/* Clear the OF bit of Flags Register */
> -	flags =3D i2c_smbus_read_byte_data(client, M41T80_REG_FLAGS);
> -	if (flags < 0)
> -		return flags;
> -
> -	err =3D i2c_smbus_write_byte_data(client, M41T80_REG_FLAGS,
> -					flags & ~M41T80_FLAGS_OF);
> -	if (err < 0) {
> -		dev_err(&client->dev, "Unable to write flags register\n");
> -		return err;
> -	}
> -
>  	return err;
>  }
> =20
> --=20
> 2.34.1
>=20

--ziNpAt5qh7l7+s0D
Content-Type: application/x-pkcs7-signature
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIINIQYJKoZIhvcNAQcCoIINEjCCDQ4CAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0B
BwGgggpVMIIFXzCCBEegAwIBAgIQD/rh8xorQzw9muFtZDtYizANBgkqhkiG9w0BAQsFADBl
MQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkwFwYDVQQLExB3d3cuZGln
aWNlcnQuY29tMSQwIgYDVQQDExtEaWdpQ2VydCBBc3N1cmVkIElEIFJvb3QgRzIwHhcNMTkw
OTIzMTIyNTMyWhcNMzQwOTIzMTIyNTMyWjBqMQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGln
aUNlcnQgSW5jMRkwFwYDVQQLExB3d3cuZGlnaWNlcnQuY29tMSkwJwYDVQQDEyBEaWdpQ2Vy
dCBBc3N1cmVkIElEIENsaWVudCBDQSBHMjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoC
ggEBAOqxRa06rLwKBvrDb/qQ8RtXfeKA9o0A42oZbLF4GYr4Xdt9JE8r3PJRIOUZD1U3mEln
4S/aZoS54Q+5Ecs3q2GGT/Z82VeAPLeGvJoT0LS5t/zXeUcbMuDFWgyj33kiesnuusnOWvpI
SoxN+oBH4oo0+oUiHI65mMjMAlb93x6sabh9kKvHQvHC4x2u7wYv5+NXjnbOhJS/1NjGq+ug
LMXeldFMz0O5qFIDpn3aQGU0htyJQ2SZyxEqlUrgunsrYj9wgfW7XuhAi2j0y5d9oMT0SuVe
KFFnQhTEk5B3fq+OBOW0AU2JdW1r929UtRbAr8RpLt05WI2G2RNVVlHYaU0CAwEAAaOCAgQw
ggIAMB0GA1UdDgQWBBSlYiBQ3LtbV5etI4814lRsqX75TjAfBgNVHSMEGDAWgBTOw0q5mVXy
uNtgv6l+vVa1lzan1jAOBgNVHQ8BAf8EBAMCAYYwTAYDVR0lBEUwQwYIKwYBBQUHAwIGCCsG
AQUFBwMEBgorBgEEAYI3CgMEBgorBgEEAYI3FAICBgorBgEEAYI3CgMMBgkqhkiG9y8BAQUw
EgYDVR0TAQH/BAgwBgEB/wIBADA0BggrBgEFBQcBAQQoMCYwJAYIKwYBBQUHMAGGGGh0dHA6
Ly9vY3NwLmRpZ2ljZXJ0LmNvbTBFBgNVHR8EPjA8MDqgOKA2hjRodHRwOi8vY3JsMy5kaWdp
Y2VydC5jb20vRGlnaUNlcnRBc3N1cmVkSURSb290RzIuY3JsMIHOBgNVHSAEgcYwgcMwgcAG
BFUdIAAwgbcwKAYIKwYBBQUHAgEWHGh0dHBzOi8vd3d3LmRpZ2ljZXJ0LmNvbS9DUFMwgYoG
CCsGAQUFBwICMH4MfEFueSB1c2Ugb2YgdGhpcyBDZXJ0aWZpY2F0ZSBjb25zdGl0dXRlcyBh
Y2NlcHRhbmNlIG9mIHRoZSBSZWx5aW5nIFBhcnR5IEFncmVlbWVudCBsb2NhdGVkIGF0IGh0
dHBzOi8vd3d3LmRpZ2ljZXJ0LmNvbS9ycGEtdWEwDQYJKoZIhvcNAQELBQADggEBAHZrbCQC
o3MAIqR0kekGYrC70EAGRDRq11COufNEXhcpv3YH6BMhUoVinPPNgfo5HPrZAFrLK/KPXYdJ
dgkASGsINabAfY2ljUaJwKlpIewwjS6KuGEn59MgidaAUPh6lbetIoRsLhCqCzAnX1aL99fj
CMf4NMWLUC8TqotnnrKNuw4JSjx4fcQs+U5T1bbgnyDx+8ybONuIEDvinHdKDu2VjoECzez2
y/1IVTPlh57zBfjHJQFqLWzHdou8M+ucdJtr2swXII6s3nkq4pfEn7KnbzMS9quFSuyOGILc
g/3qVwaHNLM5R+8nB5gPI5+u5Uh56w1i+9Ds1pjYAiTHdeUwggTuMIID1qADAgECAhAImztE
U4o9odkEsuVgiJc8MA0GCSqGSIb3DQEBCwUAMGoxCzAJBgNVBAYTAlVTMRUwEwYDVQQKEwxE
aWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5jb20xKTAnBgNVBAMTIERpZ2lD
ZXJ0IEFzc3VyZWQgSUQgQ2xpZW50IENBIEcyMB4XDTI0MDUwMzAwMDAwMFoXDTI2MDUwNjIz
NTk1OVowQjEcMBoGA1UEAwwTY21pbnlhcmRAbXZpc3RhLmNvbTEiMCAGCSqGSIb3DQEJARYT
Y21pbnlhcmRAbXZpc3RhLmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAJm1
ZE9brEiQnF7EKiV+aYzHyqPFJ+z1wwdJ4wvNiwUCgXJejBxFj04Z7A62Yx6Sp59vfjbo05eA
IOyaLOFp3vbMBQAe8Qe4XrFv7wPcKZxwS+sgCuBvNs4NVGKYGjiKZW8WPq9ZcEl5BM8BLMrl
rchAUHJJcMdcEJUsed6rIB//EtnGOe74/vR1Tz3sN1WzC1Wa9COvcbLgVvWC/o4WysUfC9+f
9/5JzAiib7U7S/iRigkmEahibZgYKB7y6F1v9hxUwHxfa7GtJ8cv6LtRcPLhAO86GgXMfpgq
k3fxzQu8uwACpINbmQNLcRzg6mHFDYRK3mFp4puUnHO5EUJ8RgUCAwEAAaOCAbYwggGyMB8G
A1UdIwQYMBaAFKViIFDcu1tXl60jjzXiVGypfvlOMB0GA1UdDgQWBBQiHrUOKuj1vJe3OXAz
gOP5Qbl2FTAeBgNVHREEFzAVgRNjbWlueWFyZEBtdmlzdGEuY29tMBQGA1UdIAQNMAswCQYH
Z4EMAQUBATAOBgNVHQ8BAf8EBAMCBaAwHQYDVR0lBBYwFAYIKwYBBQUHAwIGCCsGAQUFBwME
MIGLBgNVHR8EgYMwgYAwPqA8oDqGOGh0dHA6Ly9jcmwzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2Vy
dEFzc3VyZWRJRENsaWVudENBRzIuY3JsMD6gPKA6hjhodHRwOi8vY3JsNC5kaWdpY2VydC5j
b20vRGlnaUNlcnRBc3N1cmVkSURDbGllbnRDQUcyLmNybDB9BggrBgEFBQcBAQRxMG8wJAYI
KwYBBQUHMAGGGGh0dHA6Ly9vY3NwLmRpZ2ljZXJ0LmNvbTBHBggrBgEFBQcwAoY7aHR0cDov
L2NhY2VydHMuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0QXNzdXJlZElEQ2xpZW50Q0FHMi5jcnQw
DQYJKoZIhvcNAQELBQADggEBADkBdRyx41eUGmsYXBXt3WCsYeDr26rJL7lbx2PvqaZyRCJm
J9CN2TljF0YHsXSPU+un1RfUlYz+PtcNFIqNuSf3N5fGU0bEpSzXozd/nZ32yWFLkd5CzYyN
F1xrpbyP2a87jKM0uqEHXZFl7NPiAfEchjFCddciHTOXjN66L+kJ/ZsOoNJLG8yFN401EGew
Nk8z/hJjWqR7DG0/YWn9h7jQ5SmqkqyhLwTO9s6KoByacWuKpKWSc/DaOuWmROlROrOA1hD8
0sKqC6jGeLxNpiYzSwBy8qKF0weZdhcHUeO1HOm1csrvWl1UghnlR7SLir3bb5LiesTVvSuR
Q3aDywAxggKQMIICjAIBATB+MGoxCzAJBgNVBAYTAlVTMRUwEwYDVQQKEwxEaWdpQ2VydCBJ
bmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5jb20xKTAnBgNVBAMTIERpZ2lDZXJ0IEFzc3Vy
ZWQgSUQgQ2xpZW50IENBIEcyAhAImztEU4o9odkEsuVgiJc8MA0GCWCGSAFlAwQCAQUAoIHk
MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI1MDIwNDExNTQ0
OVowLwYJKoZIhvcNAQkEMSIEIN4MXWdfSrsHdzw/BjozyzNEvlqxci0qjIppNGbuDv5BMHkG
CSqGSIb3DQEJDzFsMGowCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIw
CgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0G
CCqGSIb3DQMCAgEoMA0GCSqGSIb3DQEBAQUABIIBADS9OVeUgy3rRkeKDmr+AGO5WZ3P0rzX
M4k/RaAJa8fxz6dKjA2pFQL14TKLJJzvd46Fn++Xz56t5PKPQ+U+T5AqCfhcuoj4M3FFa1Kk
HQZK1aoIiYoQaDwqgYXVeRuI2gMDpLDs/Iy7PcFulzmCtj3VhweiWdFgUhwegsN/XbEFj1ju
oznDyy0J7+ZrWwurbCpcf6gsgI+m2yw1KSFZJVuQxnbPq/ZDcCo3Vv36xfuSivLowf5P3bWa
YAneM3l0ZjMtX1R5eL8Y6IC4qtdkV/1PPfmkuWR75DjdnKUuVqBvnzvNMpBNc7+FJvS8CixR
AilEoBIQ5buTXyYHpiayhxI=

--ziNpAt5qh7l7+s0D--

