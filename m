Return-Path: <linux-rtc+bounces-3925-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D55A85530
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Apr 2025 09:14:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D1AF1899A10
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Apr 2025 07:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 780C028369E;
	Fri, 11 Apr 2025 07:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IyHmTNLo"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B133E27EC71;
	Fri, 11 Apr 2025 07:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744355532; cv=none; b=FiQjKKVntTMWIpPDF2EQsD3t4lemDCT5PNKJuQG4armhi1nhuPJUyJO9r9mgrcH5zTuQI6bE6bXX3YE634ZG49MN7r03W7f1AFqzfhIe611nPEizadKkNmbORS2zmEkY8/8adzvONEaIF3VEjb1um+x4zo5mGkn/Ho9+shNXNNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744355532; c=relaxed/simple;
	bh=gdrhVumeTce66VFXx6iutWVlsPAzxQz8fQdDaFP5jWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S3GmwvIn9nR46qvZuZsrZCB3c3qCtjTmgNpcuzw+0ls172OqEyxlS1NOcS999uabVBPvfDhD50r+1BmFeiNQM9KV5mn3DesV8YIOLJBEUc/3BLyLYLdRUsB7CccXtEd7IylCHyJ+4DVAxREA5TRxNovAU5lZsAWOWLaIRcyjLDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IyHmTNLo; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso1902901f8f.1;
        Fri, 11 Apr 2025 00:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744355529; x=1744960329; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C7XvJyaIebd7Gra2hTpcbnV/bUDd+9pSKlR1cZwTqv0=;
        b=IyHmTNLoBC4j0+ImOWqtepfDX4KtI8CMjKQJTLImV5cKXShaVheX92tKj91iquLe1k
         wfAUPSV0/dNKCaSGBhVqIvTnKV3WUsU0K5drw9pnqwck0dPgNLQIadHLf76ulhT+Rf4r
         q/JP+8JDbjcDlLfcAakZSb88xNrKGbEQ6ZYbF3LJfz/6+NvvckYuJz59CWv967VmkBW6
         OSBNUqk/QojzD2y5+pwtvfd8msBbsnKswkVZQu6c65tC/JF2nTCg+NaHx719Cm0OVyzr
         9BsuUmbhoGyoJlw0y3HFb5mbB8kvtIR3LAncI5MYTM+W1vadkOQHSTB/sX91oFZzt++A
         mhWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744355529; x=1744960329;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C7XvJyaIebd7Gra2hTpcbnV/bUDd+9pSKlR1cZwTqv0=;
        b=jeWad6Kdu2Jzvybay8c1A+fTvq/gfrHhkGZBZ9PTT/+RY12YD7P01vc/nuAOL/n7sW
         7MIltEkvuwkCNic/Wbel+kWajwioAXwhpaUwhz694sZgbaVObn8YtGUHxOwdPsfSRVbH
         orVIl4grAyrfIuY1wl2go/4MbGkasH22hYaudiBBHPx0mAeTDbLrA/+Qc7mW3/NRy+B9
         +j6blEdIFYYcudBA4ke2jBXRkArNKh7LTr6boJ+iBLmtMuSTvu8cdrMvr2CpqhRVnnc6
         Nar8nyyrs0h33xEqnv3xlyqfSXOwHM3Dcwuy+GOlwsHzZ4IA9Zldj9JK6I2S5oAoPPh0
         N4uQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQ9MSG++QRi6pfPuOrZlqbaN4f68X3bF/a9L446q5X1NYy5uRDOPaEiMFa7oOmrlxleuOQ2nBZyUgEPdCG@vger.kernel.org, AJvYcCVnpypBNZiMBmb5F6b2OkRi4usaeZAlWZtALsAHhQbB5Xwi1jbcgG2+Eb34hIFLtfZBv4y/1U8IjlT6@vger.kernel.org, AJvYcCW1YRUb4higcStLV9rv08FITgKU6P7V+fjWBgNLA+wjunogXEFW4glCKc+8vUTS65JfBAW+Dmvn8eUA@vger.kernel.org
X-Gm-Message-State: AOJu0YyHtgVwHhyTPHeXexpjO9VAXFQ1Uti7XPXoanaDVLlfGMZngLxx
	1Zmh8DlqIkz+45+u5ldaYyFJaYPTwvkpHn/yCpklHKZPZr60K8nDyAvrDP3HfPXx8w==
X-Gm-Gg: ASbGncu2KUzcXVj1ODQnCYLaUEFHxRsFqj9Ccspv/lKqdSWRr5UJGjRlHL7g5iGkl6h
	akxuawhTEIK/gScaCl9mvsh+8GNh4iUiAwsZT/bbGLPVbaBjppHvOAUw1sA75zEhzKDXKNc/4pK
	+QY9QBYuQWUoAGS0gH6bvd/DOhVbggWX9NffAd0N6jThHoVtJaK2DQg8j+L3L24AsCgZO5vaDWB
	Fw3XYiv1VEtET2EJuU0hdVK1HSSzkJnpxAIJ6ZhKdBM8rBKjL2I7lXsHIOjQrVtAMBR0vnR7u7k
	pgfANh5ApPCWAYUmp0m5/mBj4nlNIKGGRZ4e1F9Gc3QGVeSQtnb1YZw7KFLNiKnaSLQMdxpPWur
	ag1af2GjvAQ==
X-Google-Smtp-Source: AGHT+IHl/LN8pzBCnYdaddscA9zS4QyZ1eGKpY2s4nEo1vuy8PrG4l6gk9J2fhiJN5HFEaJ7977gNA==
X-Received: by 2002:a5d:648d:0:b0:391:65c:1b05 with SMTP id ffacd0b85a97d-39e6e48d03dmr1267790f8f.11.1744355528773;
        Fri, 11 Apr 2025 00:12:08 -0700 (PDT)
Received: from antoni-VivoBook-ASUSLaptop-X512FAY-K512FA ([37.161.217.206])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf4456fdsm1104793f8f.86.2025.04.11.00.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 00:12:08 -0700 (PDT)
Date: Fri, 11 Apr 2025 09:11:50 +0200
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: alexandre.belloni@bootlin.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	alexander.stein@ew.tq-group.com, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] dt-bindings: rtc: add binding for RV8063
Message-ID: <20250411071118.6fwnmpsgm46oejeb@antoni-VivoBook-ASUSLaptop-X512FAY-K512FA>
References: <20250407193521.634807-1-apokusinski01@gmail.com>
 <20250407193521.634807-4-apokusinski01@gmail.com>
 <20250410211351.GA1076944-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410211351.GA1076944-robh@kernel.org>

On Thu, Apr 10, 2025 at 04:13:51PM -0500, Rob Herring wrote:
> On Mon, Apr 07, 2025 at 09:35:21PM +0200, Antoni Pokusinski wrote:
> > Microcrystal RV8063 is a real-time clock module with SPI interface.
> > 
> > Signed-off-by: Antoni Pokusinski <apokusinski01@gmail.com>
> > ---
> >  .../devicetree/bindings/rtc/nxp,pcf85063.yaml | 33 ++++++++++++++++++-
> >  1 file changed, 32 insertions(+), 1 deletion(-)
> 
> Bindings come before users (driver).
> 
Fixed in v3 already.

Kind regards,
Antoni

> > 
> > diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf85063.yaml b/Documentation/devicetree/bindings/rtc/nxp,pcf85063.yaml
> > index 2f892f8640d1..cb31c7619d66 100644
> > --- a/Documentation/devicetree/bindings/rtc/nxp,pcf85063.yaml
> > +++ b/Documentation/devicetree/bindings/rtc/nxp,pcf85063.yaml
> > @@ -12,6 +12,7 @@ maintainers:
> >  properties:
> >    compatible:
> >      enum:
> > +      - microcrystal,rv8063
> >        - microcrystal,rv8263
> >        - nxp,pcf85063
> >        - nxp,pcf85063a
> > @@ -44,7 +45,12 @@ properties:
> >  
> >    wakeup-source: true
> >  
> > +  spi-cs-high: true
> > +
> > +  spi-3wire: true
> > +
> >  allOf:
> > +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> >    - $ref: rtc.yaml#
> >    - if:
> >        properties:
> > @@ -52,6 +58,7 @@ allOf:
> >            contains:
> >              enum:
> >                - microcrystal,rv8263
> > +              - microcrystal,rv8063
> >      then:
> >        properties:
> >          quartz-load-femtofarads: false
> > @@ -65,12 +72,23 @@ allOf:
> >        properties:
> >          quartz-load-femtofarads:
> >            const: 7000
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          not:
> > +            contains:
> > +              enum:
> > +                - microcrystal,rv8063
> > +    then:
> > +      properties:
> > +        spi-cs-high: false
> > +        spi-3wire: false
> >  
> >  required:
> >    - compatible
> >    - reg
> >  
> > -additionalProperties: false
> > +unevaluatedProperties: false
> >  
> >  examples:
> >    - |
> > @@ -90,3 +108,16 @@ examples:
> >            };
> >          };
> >        };
> > +
> > +  - |
> > +    spi {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        rtc@0 {
> > +          compatible = "microcrystal,rv8063";
> > +          reg = <0>;
> > +          spi-cs-high;
> > +          spi-3wire;
> > +        };
> > +    };
> > -- 
> > 2.25.1
> > 

